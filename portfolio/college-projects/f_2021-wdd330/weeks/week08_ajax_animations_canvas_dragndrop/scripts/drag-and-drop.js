// READINGS & EXERCISES
/** ------------------------------------------------------------------------
* Title: Drag and Drop API example
--------------------------------------------------------------------------- */
// For week 08
// ebook: HTML5 & CSS# for the Real World

var mice = document.querySelectorAll("#mouseContainer img");

// Loop through all the img elements contained in the mice variable, and add an event listener for the dragstart event on each computer mouse.
/** 01 - DRAGSTART ---------------------------------------------------- */
// Mice: Making Elements Draggable
var mouse = null;
for (var i = 0; i < mice.length; i++) {
	mouse = mice[i];
	mouse.addEventListener('dragstart', function (event) {

		// The DataTransfer Object
		/*
		- DataTransfer objects are one type of object outlined in the Drag and Drop API.
		- These objects allow us to set and get data about the elements that are being dragged. 
		- They can be used to pass data from dragged items to dropped targets. */
		event.dataTransfer.setData("text/plain", this.id);
	});
}

// The two events we need to monitor for are dragover and drop. We’ll need to prevent the default behavior for both these events, since the default prohibits you from dropping an element.
/** 02 - DRAGOVER ----------------------------------------------------- */
// Cat: Accepting dropped elements
var cat = document.getElementById("cat");
cat.addEventListener("dragover", function (event) {
	event.preventDefault(); // This method blocks default behaviour from the cat.
});

/** 03 - DROP --------------------------------------------------------- */

cat.addEventListener("drop", function (event) {

	// Associate each response with the ID of one of the mouse images.
	var mouseHash = {
		mouse1: 'NOMNOMNOM',
		mouse2: 'Meow',
		mouse3: 'Purrrrrr ...'
	};

	var catHeading = document.getElementById('catHeading');
	var mouseID = event.dataTransfer.getData("text/plain");
	catHeading.innerHTML = mouseHash[mouseID];

	var mousey = document.getElementById(mouseID);
	mousey.parentNode.removeChild(mousey);
	event.preventDefault();
});



