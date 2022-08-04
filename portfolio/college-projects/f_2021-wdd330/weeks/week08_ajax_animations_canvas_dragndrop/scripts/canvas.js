// READINGS & EXERCISES
/** ------------------------------------------------------------------------
* Title: Canvas API code example
--------------------------------------------------------------------------- */
// For week 08
// ebook: HTML5 & CSS# for the Real World

var canvas = document.getElementById("myCanvas");

// Set the 'context', the place where the drawing is rendered.
var context = canvas.getContext("2d");
console.log(`context → ${context}`);

// CANVAS 1 -Let's make a rectangle
context.strokeStyle = "yellow";
context.fillStyle = "rgba(225, 225, 225, 0.75)";
context.fillRect(10, 10, 100, 100);
context.strokeRect(10, 10, 100, 100);

// Nothing to see here, really
const keys = Object.keys(context);
const values = Object.values(context);
console.log(`Object (nothing to see here) → ${keys} ${values}`);

// CANVAS 2 - Let's make a pattern, using an image.
function drawPattern() {
	var canvas = document.getElementById("demo2");
	var context2 = canvas.getContext("2d");
	context2.strokeStyle = "yellow";
	
	var img = new Image();
	img.src = "./images/table.png";
	img.onload = function () {
		var pattern = context2.createPattern(img, "repeat");
		context2.fillStyle = pattern;
		context2.fillRect(10, 10, 400, 125);
		context2.strokeRect(10, 10, 400, 125);
	};

}
drawPattern();

// CANVAS 3 - Let's make a shape using partnership
var canvas3 = document.getElementById("demo3");

function drawCircle(canvas) {
	var context3 = canvas.getContext("2d");
	context3.beginPath();
	context3.arc(50, 50, 30, 0, Math.PI*2, true);
	context3.closePath();
	context3.strokeStyle = "red";
	context3.fillStyle = "blue";
	context3.lineWidth = 3;
	context3.fill();
	context3.stroke();
}
drawCircle(canvas3);

function saveCircle() {
	var canvasSave = document.getElementById("demo3");
	window.open(canvasSave.toDataURL("image/png"));
}
var button = document.getElementById("saveButton");
button.addEventListener("click", saveCircle, false)