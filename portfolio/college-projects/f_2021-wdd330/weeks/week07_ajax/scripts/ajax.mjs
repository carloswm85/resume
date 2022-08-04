// READINGS & EXERCISES
/** ------------------------------------------------------------------------
* Title: Using Ajax technologies
---------------------------------------------------------------------------
JS: From Novice to Ninja, Ch13
*/

// NOTE: Select the block of code, and run.

// This import and the case 1 fetch, are the most basic examples.
import fetch from "node-fetch";

// CASE 1
fetch('https://www.google.com/')
	.then(response => {
		console.log(
			`response case1: 
				- response → ${response}
				- response.ok → ${response.ok}
				- response.statusText → ${response.statusText}
				- response.headers → ${response.headers}
				- response.url → ${response.url}
				- response.redirected → ${response.redirected}
				- response.type → ${response.type}
				- response.text → ${response.text}
				- response.text() → ${response.text()}
				- response.blob(), for file responses → ${response.blob()}
				`);
	})
	.catch(error => {
		console.log(`Error → ${error}`);
	});

// CASE 2, this one will throw an error
import fetch from "node-fetch";
const example2 = 'https://www.google-duck.com/';
fetch(example2)
	.then(response => {
		console.log(`response case2 → ${response}`);
	})
	.catch(error => {
		console.log(`error case2 → ${error}`);
	});

// CASE 3
import fetch from "node-fetch";
const example3 = 'https://www.wikipedia.org/';
fetch(example3)
	.then(response => {
		if (response.ok) {
			return response;
		}
		// it could throw a custom error here
		throw Error('custom error case3');
	})
	.then(receivedResponse => {
		console.log(`receivedResponse case3 → ${receivedResponse}`);
		throw Error(receivedResponse.statusText);
	})
	.catch(error => {
		console.log(`error case3 → ${error}`);
	});

// CASE 4
import fetch from "node-fetch";
const url4 = 'https://www.wikipedia.org/';
const newURL = 'https://www.google.com/';
fetch(url4)
	.then(response => response.redirect(newURL)) // redirects to another URL, response.redirect is not a supported function yet 	
	.then(response => console.log(`response newURL case4 → ${response}`))
	.catch(error => console.log('There was an error case4: ', error));

// CASE 5
import fetch from "node-fetch";
const url5 = "https://www.wikipedia.org/";
fetch(url5)
	.then(response => {
		const jsonObject = response.json();
		console.log(`jsonObject case5 → ${jsonObject}`);
		return jsonObject;
	}) // transforms the JSON data into a JavaScript object. This means we can	manipulate the object using JavaScript.
	//.then(data => console.log(`Object.entries(data) case5→ ${Object.entries(data)}`))
	.then(data => console.log(Object.entries(data)))
	.catch(error => console.log('There was an error case5: ', error));


// CASE 6: RESPONSE
const response = new Response('Hello!', {
	ok: true,
	status: 200,
	statusText: 'OK',
	type: 'cors',
	url: '/api'
});
/*
- These can be useful to use if you are creating an API that needs to send a response, or
if you need to send a dummy response for testing purposes.
*/

//CASE 7: REQUEST
const request = new Request('https://example.com/data', {
	method: 'GET',
	mode: 'cors',
	redirect: 'follow',
	cache: 'no-cache'
});

fetch(request)
	.then( /* do something with the response */)
	.catch( /* handle any errors */);

// CASE 8: HEADERS
const headersOne = new Headers();
const headersTwo = new Headers(
	{
		'Content-Type': 'text/plain', 'Accept-Charset': 'utf-8', 'Accept-Encoding': 'gzip,deflate'
	});
headersTwo.has('Content-Type');
headersTwo.get('Content-Type');
headersTwo.set('Content-Type', 'application/json');
headersTwo.append('Accept-Encoding', 'gzip,deflate');
headersTwo.delete('Accept-Encoding')
for (const entry of headers.entries() {
		console.log(entry);
	}
	
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Other examples
Promise.resolve().then(() => {
	console.log(Promise);	
	throw new Error('hey');
})
	.catch(e => {
		console.log(`custom error → ${e}`);
	});