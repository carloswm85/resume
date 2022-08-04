// READINGS & EXERCISES
/** ------------------------------------------------------------------------
* Title: Functional programming, pure functions, callback use
--------------------------------------------------------------------------- */

// 1
function sum(array, callback) {
	
	if (callback) {
		array = array.map(callback);
	}
	return array.reduce((a, b) => a + b);
}

// 2
function square(x) {
	return x * x;
}

// 3
function mean(array) {
	return sum(array) / array.length;
}

// 4
function variance(array) {
	return sum(array, square) / array.length - square(mean(array))
}


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Stage 1
const summed = sum([1, 2, 3]); // returns 1 + 2 + 3
console.log(summed);

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Stage 2
const summedAndSquared = sum([1, 2, 3], square); // returns 1^2 + 2^2 + 2^3
console.log(summedAndSquared);

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Stage 3
const meaned = mean([1, 2, 3]);
console.log(meaned);

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Stage 4
const varianced = variance([1, 2, 3]);
console.log(varianced);

/** By separating each piece of functionality into individual functions, we’re able to
compose a more complex function. These functions can also be used to create more functions that require the mean, sum or variance. That's how functional programming works. And all functions must be made adhering to the pure functions rules.
 */