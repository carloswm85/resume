// READINGS & EXERCISES
/** ------------------------------------------------------------------------
* Title: Async functions
--------------------------------------------------------------------------- */
/** https://javascript.info/async-await */
/** https://stackoverflow.com/a/48433898/7389293 */

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Example 02
import fetch from "node-fetch";

async function loadJson(url) { // (1)
	
	let response = await fetch(url); // (2)
	
	if (response.status == 200) {
		let json = await response.json(); // (3)
		return json;
	}
	throw new Error(response.status);
}

const urlinput = 'https://raw.githubusercontent.com/carloswm85/my-programmer-toolbox/master/javascript/json-examples/animals-1.json';
loadJson(urlinput)
	.then(response => {
		console.log(response);
		
	})
	.catch(e => {
		console.log(e); // Error: 404 (4)
	});
