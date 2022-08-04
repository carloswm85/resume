// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 01
import {
	getJson,
	getLocation
} from "./utilities.js";


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 02
const baseUrl = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2019-01-01&endtime=2019-02-02';

// So we are going to replace that query with one located in the San Francisco, California area.
const fullUrl = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2020-01-01&endtime=2020-02-02&latitude=37.4013952&longitude=-122.9209344&maxradiuskm=100';
// Url given for testing purposes


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 03
/**
 * getLocation() and getJson() are asynchronous,
 * it's necessary to "await" for the results
 */
async function testGetQuakesForLocation() {

	// 1
	// call the getLocation function to get the lat/long	
	const myLocation = await getLocation(); // This line will retrieve a pending promise (typeof OBJECT)
	console.log('myLocation');
	console.log(myLocation);

	// 2
	// use that information to build out the correct URL
	const geoUrl = baseUrl + '&latitude=' + myLocation.coords.latitude + '&longitude=' + myLocation.coords.longitude + '&maxradiuskm=100'; // add location information here
	console.log('geoUrl');	
	console.log(geoUrl);

	// 3
	// use the url to request the correct quakes 
	const geoJson = await getJson(geoUrl);
	console.log('geoJson');
	console.log(geoJson);
	
	//log out the quakes for now.
}
testGetQuakesForLocation();