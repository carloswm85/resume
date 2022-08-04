// READINGS & EXERCISES
/** ------------------------------------------------------------------------
* Title: Async functions
--------------------------------------------------------------------------- */
/** https://javascript.info/async-await */

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Example 01
async function done(time) {

	let promise = new Promise((resolve, reject) => {
		setTimeout(() => resolve(`Done in ${time/1000} second${time != 1000 ? 's' : ''}!`), time)
	});

	// await can only be used in async functions
	// wait until the promise resolves
	let result = await promise;

	console.log(`async function output → ${result}`); // "done!"
}

const miliseconds1 = 1000;
const miliseconds2 = 2000;
const miliseconds3 = 3000;

done(miliseconds1);
done(miliseconds2);
done(miliseconds3);

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Example 02
import fetch from "node-fetch";

async function loadJson(url) { // (1)
	let response = await fetch(url); // (2)
	console.log(response);		
	
	if (response.status == 200) {
		let json = await response.json(); // (3)
		console.log(json);		
		return json;
	}
	
	throw new Error(response.status);
}

const urlinput = require('../animals.json');
loadJson(urlinput)
	.catch(console.log('alerta')); // Error: 404 (4)
