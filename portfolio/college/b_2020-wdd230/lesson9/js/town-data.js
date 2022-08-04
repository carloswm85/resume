const requestedURL = 'https://byui-cit230.github.io/weather/data/towndata.json';

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

  /*
       "name": "Fish Haven",
      "photo": "fishhaven.jpg",
      "motto": "This is Fish Heaven.",
      "yearFounded": 1864,
      "currentPopulation": 501,
      "averageRainfall": 14.20,
      "events": [
        "April 1: How Big Was That Fish Day",
        "May 15-30: Rush the Creek Days",
        "July 24: Bear Lake Blunder Run",
        "December 12: Light the Tree" 
  */

