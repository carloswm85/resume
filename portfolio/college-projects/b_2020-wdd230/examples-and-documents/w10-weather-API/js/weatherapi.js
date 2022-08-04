/*
Preston ID
  {
    "id": 5604473,
    "name": "Preston",
    "state": "ID",
    "country": "US",
    "coord": {
      "lon": -111.876617,
      "lat": 42.09631
    }
  },
*/

/*API key from: https://home.openweathermap.org/api_keys
f4051f9ae5c7a4eb58c335ed524c93c6
api.openweathermap.org/data/2.5/weather?id={city id}&appid={your api key}
*/

// API Response
/**

{
  "coord": {
    "lon": -122.08,
    "lat": 37.39
  },
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 282.55,
    "feels_like": 281.86,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },
  "visibility": 16093,
  "wind": {
    "speed": 1.5,
    "deg": 350
  },
  "clouds": {
    "all": 1
  },
  "dt": 1560350645,
  "sys": {
    "type": 1,
    "id": 5122,
    "message": 0.0139,
    "country": "US",
    "sunrise": 1560343627,
    "sunset": 1560396563
  },
  "timezone": -25200,
  "id": 420006353,
  "name": "Mountain View",
  "cod": 200
}

*/

const apiURL = 'http://api.openweathermap.org/data/2.5/weather?id=5604473&appid=f4051f9ae5c7a4eb58c335ed524c93c6';

fetch(apiURL)
  .then((response) => response.json())
  .then((jsObject) => {
    console.table(jsObject);
    console.log(jsObject);

    document.getElementById('current-temp').textContent = jsObject.main.temp;

    const imagesrc = 'http://openweathermap.org/img/w/' + jsObject.weather[0].icon + '.png';  // note the concatenation
    const desc = jsObject.weather[0].description;  // note how we reference the weather array
    document.getElementById('imagesrc').textContent = imagesrc;  // informational specification only
    document.getElementById('imagedesc').textContent = desc;  // informational specification only
    document.getElementById('icon').setAttribute('src', imagesrc);  // focus on the setAttribute() method
    document.getElementById('icon').setAttribute('alt', desc);
  });


/*
fetch(requestedURL)
	.then(function (response) {
		return response.json();
	})
	.then(function (jsonObject) {
		const towns = jsonObject['towns'];
		console.table(jsonObject);  // temporary checking for valid response and data parsing

		const filteredTowns = towns.filter(town => (town.name == 'Fish Haven' || town.name == 'Preston' || town.name == 'Soda Springs'))

		filteredTowns.forEach(town => {
			let card = document.createElement('section');
			let textContainer = document.createElement('div');
			let h2 = document.createElement('h2');
			let h3 = document.createElement('h3');
			let p1 = document.createElement('p');
			let p2 = document.createElement('p');
			let p3 = document.createElement('p');
			let image = document.createElement('img');

			h2.textContent = town.name
			h3.textContent = town.motto
			p1.textContent = `Year Founded: ${town.yearFounded}`;
			p2.textContent = `Population: ${town.currentPopulation}`;
			p3.textContent = `Annual Rain Fall: ${town.averageRainFall}`;
			// image.setAttribute('alt', prophets[i].name + ' ' + prophets[i].lastname + ' - ' + prophets[i].order);
			image.setAttribute('src', `images/${town.photo}`);

			textContainer.appendChild(h2);
			textContainer.appendChild(h3);
			textContainer.appendChild(p1);
			textContainer.appendChild(p2);
			textContainer.appendChild(p3);
			card.appendChild(textContainer);
			card.appendChild(image);

			document.querySelector('div.towns-container').appendChild(card);
		});
	});
*/