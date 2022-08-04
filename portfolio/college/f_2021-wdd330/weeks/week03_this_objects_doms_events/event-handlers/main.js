function doSomething(myEvent) {
	console.log(myEvent.type);
}

function doSomething2(myEvent) {
	console.log(myEvent.target);
}

function doSomething3(myEvent) {
	console.log(`Screen: (${myEvent.screenX}, ${myEvent.screenY}) // Page: (${myEvent.pageX}, ${myEvent.pageY}) // Client: (${myEvent.clientX}, ${myEvent.clientY})`);
}

addEventListener('click', doSomething);
addEventListener('click', doSomething2);
addEventListener('click', doSomething3);