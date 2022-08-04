// READINGS & EXERCISES
/** ------------------------------------------------------------------------
* Title: Currying functions
--------------------------------------------------------------------------- */

function curry(func, ...oldArgs) {
	return function (...newArgs) {
		const allArgs = [...oldArgs, ...newArgs];
		return func(...allArgs);
	}
}

const divider = (x, y) => x / y;

console.log(divider(10, 5)); // 2

// ((x, y) => x / y)(...[1 /* comes from reciprocal */ ], ...[2]);
const reciprocal = curry(divider, 1);
// its creating a new function where 1 is passed as the first parameter to divider(inside oldArgs) and when you call reciprocal(2), it calculates divider(1, 2)

console.log(reciprocal(2)); // 0.5
