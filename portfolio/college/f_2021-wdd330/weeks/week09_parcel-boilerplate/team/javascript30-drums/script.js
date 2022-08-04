// TEAM ACTIVITY
/** ------------------------------------------------------------------------
* Title: Keyboard drum
--------------------------------------------------------------------------- */

/** CONTENT:
 * - keyevents
 * - play audios
 * - listening for transitionend
 */
var keyboardCounter = {}

// 01
function playSound(event) {

	console.log(event); // it will catch up a KeyboardEvent
	// console.log(`event.keyCode → ${event.keyCode}`);
	// console.log(`event.type → ${event.type}`);

	// it selects the "audio" HTML element with the attribute of "data-key"
	const audio = document.querySelector(`audio[data-key="${event.keyCode}"]`);
	// console.log(`audio → ${audio}`);

	// it selects the HTML element with the class of "key", which has the attribute of "data-key" equals something
	const key = document.querySelector(`.key[data-key="${event.keyCode}"]`);
	console.log(key);
	

	if (!audio) return; // stops the function from running all together.

	audio.currentTime = 0; // it rewinds to the start, which allows to run the sound right away.
	audio.play();

	key.classList.add('playing');
}

// 02
var count = 0;
function removeTransition(evento) {
	// propertyName returns the name of the CSS property associated with the transition, when the transitionEvent occurs
	if (evento.propertyName !== 'transform') return; // shift the class if it is not a transform.
	// console.log(evento);

	// .key {
	// 		transition: all .07 s ease; /* here */
	// }

	// .playing {
	// 		transform: scale(1.3); /* and here */
	// }

	// console.log(`this → ${this}`);
	this.classList.remove('playing');
}

// 03
// Event listeners must be added individually to each item from the array
const keys = document.querySelectorAll('.key');

// do something with a <div> element when a CSS transition has ended
keys.forEach(key => key.addEventListener('transitionend', removeTransition));
window.addEventListener('keydown', playSound);