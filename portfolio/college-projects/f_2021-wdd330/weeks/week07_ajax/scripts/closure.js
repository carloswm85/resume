// READINGS & EXERCISES
/** ------------------------------------------------------------------------
* Title: Closure functions
--------------------------------------------------------------------------- */
// Example <<
/**
 * A closure is formed when the inner
 * function is returned by the outer function, 
 * maintaining access to any variables declared
 * inside the enclosing function.
 */

// outer function
function closure() {
	const a = 1.8;
	const b = 32;
	return c => c * a + b; // inner function, anonymous arrow function
}

/*
	the returned function
	maintains access to the variables "a" and
	"b" even after the closure() function has
	been invoked.
*/
const toFahrenheit = closure();

// call the function (c) => c * a + b with 30 as c
let value = toFahrenheit(30);

console.log(`Fahrenheit: ${value}`);