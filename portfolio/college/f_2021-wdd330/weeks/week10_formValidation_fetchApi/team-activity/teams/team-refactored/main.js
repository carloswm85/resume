// REFACTORED VERSION
import {
	getJson,
	getLocation
} from "./utilities-refactored.js";


// We need to refactor the everything function. In the end we want a function like below
// create the appropriate functions, move the functionality from everything() to the
// functions so that the showQuakes() function below will work.
async function showQuakes() {
	// get the current location
	const location = await initPos();
	// get the list of quakes for the location
	quakes = await getQuakesForLocation(location);
	// render the list to the list element
	const listElement = document.querySelector("#quakeList");
	listElement.innerHTML = generateListMarkup(
		quakes.features,
		earthquakeListTemplate
	);

	// attach a listener to the quakes that will listen for a click and render out details about the quake
	listElement.addEventListener("click", earthQuakeClickHandler);
}


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> TESTING
function testGetQuakesForLocation() {
	const geoLocationPromise = getLocation();
	geoLocationPromise
		.then(data => {

			// console.log(data);			
			// const geoUrl = baseUrl + `&latitude=${data.coords.latitude}&longitude=${data.coords.longitude}&maxradiuskm=${100}`;

			// San Francisco, California, area
			const geoUrl = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2020-01-01&endtime=2020-02-02&latitude=37.4013952&longitude=-122.9209344&maxradiuskm=100'; // For testing purposes


			// console.log(geoUrl);			
			const getJsonInformation = getJson(geoUrl);

			console.log(getJsonInformation);
			getJsonInformation.then(data2 => {
				console.log(data2);
			});
		})
		.catch(err => {
			console.log(err);
		});
}

testGetQuakesForLocation();