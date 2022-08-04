// READINGS & EXERCISES
/** ------------------------------------------------------------------------
* Title: Promise, example 2
--------------------------------------------------------------------------- */
// From Novice to Ninja, Javascript, page 405

const dice = {
	sides: 6,
	roll() {
		return Math.floor(this.sides * Math.random()) + 1;
	}
}

console.log('Before the roll');

const roll = new Promise((resolve, reject) => {
	const n = dice.roll();
	if (n > 3) {
		setTimeout(() => {
			resolve(n)
		}, n * 2000);
	} else {
		setTimeout(() => reject(n), n * 3000);
	}
});

console.log('After the roll'); // point 01

roll.then(result => console.log(`I rolled a ${result}`))
	// .then(result2 => console.log(`Again I'll tell you: I rolled a ${result2}`))
	// The previous line requires the .then before to fulfill a given promise.
	.catch(result => console.log(`Drat! ... I rolled a ${result}`));

// All the code is processed while the promise is resolved.
console.log('Promise pending.');
// Before going back to point 01