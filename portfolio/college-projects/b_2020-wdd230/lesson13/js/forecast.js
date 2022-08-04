/**
 * CONTENT: Cozumel data from JSON files, weather API
 * Cozumel ID: 3530103
 * lon: -86.945831
 * lat: 20.508329 
 * 
 * 	(1) - Weather API data
 *		(1.a) - Summary weather data
 * 		(1.b) - Forecast weather data
 */

 /* (1) Weather API data */
const apiURLforecast = 'https://api.openweathermap.org/data/2.5/forecast?id=3530103&units=imperial&appid=f4051f9ae5c7a4eb58c335ed524c93c6';

// (1.b) FORECAST
fetch(apiURLforecast)
.then((response) => response.json())
.then((jsObject) => {
  
  // Filtering
  let fiveDays = jsObject.list.filter(element => element.dt_txt.includes('12:00:00'));
  console.log(fiveDaysForecast);

  let index = 0;
  // Looping through the filtered array
  fiveDays.forEach(forecast => {
    // Getting the days and the temperature
    console.log(forecast.main.temp_max);
    console.log(index);
    document.getElementById(`forecast-cozumel-temp-${index}`).textContent = forecast.main.temp_max;
    
    index++;
  });
});