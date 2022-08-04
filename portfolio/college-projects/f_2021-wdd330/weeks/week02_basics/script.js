/**
 * LAST EDIT
 */
const lastEdit = document.querySelector(".last-edit");
const theDate = new Date(document.lastModified).toLocaleDateString();
lastEdit.innerText = theDate;


/** ------------------------------------------------------------------------
 * Novice to Ninja
 --------------------------------------------------------------------------- */

// Ch2
// Infinity
console.log('>>> Novice to Ninja, Ch2');
console.log('\n>> Infinity');
const num = 12.2;
const num1 = 1e308;
const num2 = 1e309;
const num3 = 1 / 0;
console.log(`num value: ${num}; typeof ${ typeof (num) }`);
console.log(`num1 value: ${num1}; typeof ${ typeof (num1) }`);
console.log(`num2 value: ${num2}; typeof ${ typeof (num2) }`);
console.log(`num3 value: ${num3}; typeof ${ typeof (num3) }`);

// Ch3
// Maps
console.log('>>> Novice to Ninja, Ch3');
console.log('\n>> Maps');
const romanNumbers = new Map();
romanNumbers.set(1, 'I').set(2, 'II').set(3, 'III');
console.log(romanNumbers); // When printed, the arrow → is called "hash rocket".

// Ch4: Functions
console.log('>>> Novice to Ninja, Ch4');
// arguments: It is an object.
console.log('\n>> arguments()');

function arguments() {
	console.log(typeof (arguments));
	return arguments;
}
const result = arguments('hello', NaN);
console.log(typeof (result));
console.log(result);

// rest: It is an actual array
console.log('\n>> rest(... args)');

function rest(...args) {
	console.log(typeof (args));
	return args;
}
const result2 = rest(1, 2, 3, 4);
console.log(typeof (result2));
console.log(result2);

/* Quiz Ninja Project */
// Ch2
console.log('\n>> Quiz Ninja Project');
const question = "(TEST) What is Superman's real name?\n(You can read the code for this in the raw JS file link)"
const answer = prompt(question);
alert(`(TEST) You answered ${answer}`);

// Ch3
const quiz = [
	["(Game 1) What's Superman real name?", "Clark Kent (Game 1) "],
	["(Game 1) What is Wonder Woman's real name?", "Diana Prince (Game 1) "],
	["(Game 1) What is Batman's real name?", "Bruce Wayne (Game 1) "]
];
let score = 0;

for (const [question, answer] of quiz) {
	const response = prompt(question);

	if (response === answer) {
		alert('(Game 1) Correct!');
		score++;
	} else {
		alert(`(Game 1) Wrong! The correct answer was ${answer}`);
	}
}

alert(`(Game 1) Game Over, you scored ${score} point${score !== 1 ? 's' : ''}`);

// Ch4
const quiz23 = [
	["(Game 2) What is Superman's real name?", "Clark Kent (Game 2)"],
	["(Game 2) What is Wonder Woman's real name?", "Diana Prince (Game 2)"],
	["(Game 2) What is Batman's real name?", "Bruce Wayne (Game 2)"]
];

function startGame2(quiz) {
	let score = 0;
	// main game loop
	for (const [question, answer] of quiz) {
		const response = ask(question);
		check(response, answer);
	} // end of main game loop
	gameOver();
	
	// function declarations
	function ask(question) {
		return prompt(question);
	}

	function check(response, answer) {
		if (response === answer) {
			alert('(Game 2) Correct!');
			score++;
		} else {
			alert(`(Game 2) Wrong! The correct answer was ${answer}`);
		}
	}

	function gameOver() {
		alert(`(Game 2) Game Over, you scored ${score} point${score !== 1 ?'s' : ''}`);
	}
}

startGame2(quiz23);


/** ------------------------------------------------------------------------
 * Eloquent JavaScript
 --------------------------------------------------------------------------- */
 console.log('\nELOQUENT JAVASCRIPT');

 // Ch2
console.log('Chapter 2');
 
/** 2.1
  * Write a loop that makes seven calls to console.log to output the following triangle:
  * #
  * ##
  * ###
  * ####
  * #####
  * ######
  * #######
  */
let hash = '#';
for (let count = 0; count <= 7; count++) {
	console.log(hash);
	hash += '#';
}

 
 /** 2.2
  * Write a program that uses console.log to print all the numbers from 1 to 
  * 100, with two exceptions. For numbers divisible by 3, print "Fizz" instead 
  * of the number, and for numbers divisible by 5 (and not 3), print "Buzz"
  * instead.
  * 
  * When you have that working, modify your program to print "FizzBuzz" for
  * numbers that are divisible by both 3 and 5 (and still print "Fizz" or 
  * "Buzz" for numbers divisible by only one of those).
  * 
  */
 let output = 0;
 for (let number = 1; number <= 100; number++) {
	output = number;
	if (output % 3 == 0 && output % 5 == 0) {
		output = 'FizzBuzz';
	} else if (output % 3 == 0) {
		output = 'Fizz';
	} else if (output % 5 == 0) {
		output = 'Buzz';
	}
	console.log(`Num: ${number} → ${output}`);
}


/** 2.3
 * Write a program that creates a string that represents an 8× 8 grid, using 
 * newline characters to separate lines.At each position of the grid there 
 * is either a space or a "#" character.The characters should form a 
 * chessboard.
 * 
 * When you have a program that generates this pattern, define a binding 
 * size = 8 and change the program so that it works for any size, outputting 
 * a grid of the given width and height.
 */
let grid = '';
let size = 8;
for (let i = 0; i < size; i++) {
	if (i % 2 == 0)
		grid += ' ';
	for (let j = 0; j < size; j++) {
		if (j % 2 == 0)
			grid += '#';
		else
			grid += ' ';
	}
	grid += '\n';
}
console.log(grid);


// Ch3
console.log('Chapter 3')

/** 3.1
 * The previous chapter introduced the standard function Math.min that returns 
 * its smallest argument.We can build something like that now.Write a function 
 * min that takes two arguments and returns their minimum.
 */
function min(x, y) {
	if (x >= y)
		return y
	else
		return x
}
console.log(min(0, 10));
console.log(min(0, -10));

/** 3.2 Recursion
 * We’ ve seen that % (the remainder operator) can be used to test whether a 
 * number is even or odd by using % 2 to see whether it’ s divisible by two.
 * Here’ s another way to define whether a positive whole number is even or odd:
 * 		- Zero is even.
 * 		- One is odd.
 * 		- For any other number N, its evenness is the same as N - 2. 
 * Define a recursive function isEven corresponding to this description.The 
 * function should accept a single parameter(a positive, whole number) and 
 * return a Boolean.
 * 
 * Test it on 50 and 75. See how it behaves on - 1. Why ? Can you think of a 
 * way to fix this ?
 */
function isEven(n) {
	if (n == 0)
		return true
	else if (n == 1)
		return false
	else if (n < 0)
		return isEven(-n)
	else
		return isEven(n - 2)
}
console.log(isEven(50));
console.log(isEven(75));
console.log(isEven(-1));


/** 3.3
 * Write a function countBs that takes a string as its only argument and 
 * returns a number that indicates how many uppercase“ B” characters 
 * there are in the string.
 */
console.log("test" [2]);
function countChar(word, letter = 'b') {
	let count = 0;
	for (let i = 0; i < word.length; i++) {
		if (word[i] == letter)
			count++;
	}
	return count;
}
console.log(countChar('This Bibiana banana string has two lowercase Bs'));
console.log(countChar("BBC"));
console.log(countChar("kakkerlak", "k"));
