/**
 * CONTENT: Soda Springs data from JSON files, weather API
 * Soda Springs ID: 5607916
 * 
 * 	(1) - Weather API data
 *    (1.a) - Summary weather data
 * 		(1.b) - Forecast weather data
 * 	(2) - Events data
 */

 /* (1) Weather API data */
const apiURLWeatherSummarySodaSprings = 'https://api.openweathermap.org/data/2.5/weather?id=5607916&units=imperial&appid=f4051f9ae5c7a4eb58c335ed524c93c6';
const apiURLForecastSodaSprings = 'https://api.openweathermap.org/data/2.5/forecast?id=5607916&units=imperial&appid=f4051f9ae5c7a4eb58c335ed524c93c6';


// (1.a) SUMMARY WEATHER
fetch(apiURLWeatherSummarySodaSprings)
  .then((response) => response.json())
  .then((jsObject) => {
    
    let currently = jsObject.weather[0].description;
    let temp_high = jsObject.main.temp_max;
    let windChill = 0.0;
    let humidity = jsObject.main.humidity;
    let windSpeed = jsObject.wind.speed;

    // WINDCHILL formula
    if (temp_high < 50 && windSpeed > 3) {
        windChill = 35.74 + 0.6215 * temp_high - 35.75 * windSpeed ** 0.16 + 0.4275 * temp_high * windSpeed ** 0.16;
        windChill = Math.round(windChill * 10) / 10;
        windChill_display = windChill + ' &#8457;';
    } else {
        windChill_display = 'N/A';
    }

    document.getElementById('weather-soda-springs-1').innerHTML = currently;
    document.getElementById('weather-soda-springs-2').innerHTML = temp_high;
    document.getElementById('weather-soda-springs-3').innerHTML = windChill_display;
    document.getElementById('weather-soda-springs-4').innerHTML = humidity;
    document.getElementById('weather-soda-springs-5').innerHTML = windSpeed;
  });

// (1.b) FORECAST
fetch(apiURLForecastSodaSprings)
  .then((response) => response.json())
  .then((jsObject) => {
    
    // Filtering
    let fiveDaysForecast = jsObject.list.filter(element => element.dt_txt.includes('18:00:00'));
    
    // Making days of the week
    let weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    let index = 0;
    // Looping through the filtered array
    fiveDaysForecast.forEach(forecast => {
      let dayNumber = new Date(forecast.dt_txt);

      // Getting the days and the temperature
      document.getElementById(`forecast-soda-springs-day-${index}`).textContent = weekDays[dayNumber.getDay()];
      document.getElementById(`forecast-soda-springs-temp-${index}`).textContent = forecast.main.temp_max;

      // Getting the image from the server
      let imgScr = `https://openweathermap.org/img/w/${forecast.weather[0].icon}.png`;
      document.getElementById(`forecast-soda-springs-img-${index}`).setAttribute('src', imgScr);

      // Getting the alt description for the img
      let imgAlt = forecast.weather[0].description;
      document.getElementById(`forecast-soda-springs-img-${index}`).setAttribute('alt', imgAlt);
      index++;
    });

  });


/* (2) Events data */
const eventsURLSodaSprings = 'https://byui-cit230.github.io/weather/data/towndata.json';

fetch(eventsURLSodaSprings)
  .then((response) => response.json())
  .then((jsonObject) => {

	const towns = jsonObject['towns'];

	const filteredTown = towns.filter(town => (town.name == 'Soda Springs'));

	filteredTown.forEach(town => {

		let ul = document.querySelector('.events-list-soda-springs');
		let li1 = document.createElement('li');
		let li2 = document.createElement('li');
		let li3 = document.createElement('li');
		
		li1.textContent = town.events[0];
		li2.textContent = town.events[1];
		li3.textContent = town.events[2];

		ul.appendChild(li1);
		ul.appendChild(li2);
		ul.appendChild(li3);
	});
});