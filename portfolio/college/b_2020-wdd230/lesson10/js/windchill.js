// f = 35.74 + 0.6215 * t - 35.75 * s ** 0.16 + 0.4275 * t * s ** 0.16
/*  f: wind chill factor in Farenheit
    t: air average temperature in F
    s: wind speed in miles per hour
*/

/* INPUT REQUIREMENTS:
      f: It has temperatures t below 10 ºC (50 ºF), and wind speeds s
      above 4.8 kilometers per hour (3.0 mph)
*/

current = 'Sunny';
high = document.querySelector('.weather-high').innerHTML; // Temperature
windChill = 0.0;
humidity = 0.0;
windSpeed = document.querySelector('.weather-wind').innerHTML;

windChill_display = document.querySelector('.weather-chill').innerHTML;
console.log(high, windSpeed);

if (high < 50 && windSpeed > 3) {
    windChill = 35.74 + 0.6215 * high - 35.75 * windSpeed ** 0.16 + 0.4275 * high * windSpeed ** 0.16;
    windChill = Math.round(windChill * 10) / 10;
    console.log(windChill);
    windChill_display = windChill + ' &#8457;';
    
} else {
    windChill_display = 'N/A';
}

document.querySelector('.weather-current').innerHTML = current;
document.querySelector('.weather-chill').innerHTML = windChill_display;
document.querySelector('.weather-humidity').innerHTML = humidity;


