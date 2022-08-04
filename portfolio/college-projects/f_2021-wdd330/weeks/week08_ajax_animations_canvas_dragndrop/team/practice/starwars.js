// Create a basic application and use fetch to pull a list of people or ships. Display this list in the browser window.
let currentPage = 1;

async function loadJson(url) { // (1)
	let response = await fetch(url); // (2)

	if (response.status == 200) {
		let json = await response.json(); // (3)
		return json;
	}
	throw new Error(response.status);
}

// get promise
function resultPromise(page) {
	let url = `https://swapi.dev/api/people/?page=${page}`;

	let resultPromise = loadJson(url)
		.then(data => {
			return data;
		})
		.catch(function (err) {
			console.log(err);
		});

	return resultPromise;
}

// display promise
function displayData(page) {
	let container = document.getElementById('fetch-output');
	let starwarsData = resultPromise(page)

	starwarsData.then((starwarsDataResult) => {

		for (let index = 1; index < starwarsDataResult.count; index++) {
			const entity = starwarsDataResult.results[index];
			const entityTitle = document.createElement('h3')
			const entityContainer = document.createElement('ul');

			entityContainer.appendChild(entityTitle);
			
			// TODO: Process films
			for (const [key, value] of Object.entries(entity)) {
				// console.log(`entity${index} → ${key}: ${value}`);
				const entityFeature = document.createElement('li')
				entityFeature.innerHTML = `${key}: ${value}`;
				entityContainer.appendChild(entityFeature);
			}
			entityTitle.innerHTML = `${entity['name']}`;
			container.appendChild(entityContainer);
		}
	});


}

// TODO: make buttons work
// https://byui.instructure.com/courses/160562/quizzes/2612997?module_item_id=20163472
const previous = document.getElementById('previous');
const next = document.getElementById('next');

previous.addEventListener('click', evento => displayData(currentPage--));
next.addEventListener('click', evento => displayData(currentPage++));

window.onload = async () => {
	await displayData(currentPage);
}