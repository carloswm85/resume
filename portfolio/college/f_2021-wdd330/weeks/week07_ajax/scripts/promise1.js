// READINGS & EXERCISES
/** ------------------------------------------------------------------------
* Title: Promise, example 1
--------------------------------------------------------------------------- */
// From Novice to Ninja, Javascript, page 405

const dice = {
	sides: 6,
	roll() {
		return Math.floor(this.sides * Math.random()) + 1;
	}
}

// PROMISE01 -------------------------------------------------------------
const promise01 = new Promise((resolve, reject) => {
	const n = dice.roll();
	setTimeout(() => {
		(n > 3) ? resolve(n) : reject(n);
	}, n * 1000);
});

console.log(`dice.roll() → ${dice.roll()}`); // displays dice number result
console.log(`promise01 → ${promise01}`); // displays [object Promise]
console.log(`promise01.result 01 → ${promise01.result}`); // displays undefined

promise01.then(
	result => console.log(`Yeah, baby! I rolled ${result} ← promise01`), // fullfilled promise OR
	result => console.log(`Oh, noes! I rolled ${result} ← promise01`) // rejected promise, unhandled
);
	
console.log(`promise01.result 02 → ${promise01.result}`); // displays <pending>

setTimeout(() => {
	// resolved promise displays the value result
	promise01.then(result => console.log(`setTimeout() → ${result}`));
	// but rejected one, displays UnhandledPromiseRejectionWarning (verbose text)
}, 7000);


// PROMISE02 -------------------------------------------------------------
const promise02 = new Promise((resolve, reject) => {
	const n = dice.roll();
	setTimeout(() => {
		(n > 3) ? resolve(n): reject(n);
	}, n * 1000);
});

promise02.then(
	result => console.log(`Yeah, baby! I rolled ${result} ← promise02`), // fullfilled promise OR
).catch(
	result => console.log(`Oh, noes! I rolled ${result} ← promise02`) // rejected promise, handled
);