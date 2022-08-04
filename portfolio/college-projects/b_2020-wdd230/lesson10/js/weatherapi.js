const apiURL = 'https://api.openweathermap.org/data/2.5/weather?id=5604473&units=imperial&appid=f4051f9ae5c7a4eb58c335ed524c93c6';
const apiURLforecast = 'https://api.openweathermap.org/data/2.5/forecast?id=5604473&units=imperial&appid=f4051f9ae5c7a4eb58c335ed524c93c6';

// SUMMARY SECTION
fetch(apiURL)
  .then((response) => response.json())
  .then((jsObject) => {
    
    const currently = jsObject.weather[0].description;
    const temp_high = jsObject.main.temp_max;
    const windChill = 0.0;
    const humidity = jsObject.main.humidity;
    const windSpeed = jsObject.wind.speed;

    // WINDCHILL formula
    if (temp_high < 50 && windSpeed > 3) {
        windChill = 35.74 + 0.6215 * temp_high - 35.75 * windSpeed ** 0.16 + 0.4275 * temp_high * windSpeed ** 0.16;
        windChill = Math.round(windChill * 10) / 10;
        windChill_display = windChill + ' &#8457;';
    } else {
        windChill_display = 'N/A';
    }

    document.getElementById('weather-preston-1').innerHTML = currently;
    document.getElementById('weather-preston-2').innerHTML = temp_high;
    document.getElementById('weather-preston-3').innerHTML = windChill_display;
    document.getElementById('weather-preston-4').innerHTML = humidity;
    document.getElementById('weather-preston-5').innerHTML = windSpeed;
  });

// FORECAST SECTION
fetch(apiURLforecast)
  .then((response) => response.json())
  .then((jsObject) => {
    
    // Filtering
    const fiveDaysForecast = jsObject.list.filter(element => element.dt_txt.includes('18:00:00'));
    
    // Making days of the week
    const weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    let index = 0;
    // Looping through the filtered array
    fiveDaysForecast.forEach(forecast => {
      let dayNumber = new Date(forecast.dt_txt);

      // Getting the days and the temperature
      document.getElementById(`forecast-day-${index}`).textContent = weekDays[dayNumber.getDay()];
      document.getElementById(`forecast-preston-${index}`).textContent = forecast.main.temp_max;

      // Getting the image from the server
      let imgScr = `https://openweathermap.org/img/w/${forecast.weather[0].icon}.png`;
      document.getElementById(`forecast-preston-img-${index}`).setAttribute('src', imgScr);

      // Getting the alt description for the img
      let imgAlt = forecast.weather[0].description;
      document.getElementById(`forecast-preston-img-${index}`).setAttribute('alt', imgAlt);
      index++;
    });

  });