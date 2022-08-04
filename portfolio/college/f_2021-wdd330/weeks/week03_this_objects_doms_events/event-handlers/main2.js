const clickParagraph = document.getElementById('click');
const dblclickParagraph = document.getElementById('dblclick');
const mouseParagraph = document.getElementById('mouse');

// 1
clickParagraph.addEventListener('click', () => console.log('click'));
clickParagraph.addEventListener('mousedown', () => console.log('up'));
clickParagraph.addEventListener('mouseup', () => console.log('down'));

dblclickParagraph.addEventListener('dblclick', highlight);

function highlight(event23) {
	event23.target.classList.toggle('highlight');
}

// 2
mouseParagraph.addEventListener('mouseover', highlight);
mouseParagraph.addEventListener('mouseout', highlight);

// 3
mouseParagraph.addEventListener('mousemove', () => console.log('Moved!'));

// 4
addEventListener('keydown', highlight);

// 5
// the event can be named any way I like.
console.log();
addEventListener('keyup', (event8898d9) => console.log(`KEYUP. You stopped pressing the key on ${new Date}; ${event8898d9}`));
addEventListener('keyup', (event77) => console.log(`KEYUP. This is an: ${event77}`));

addEventListener('keypress', (octopus) => console.log(`KEYPRESS. You pressed the ${octopus.key} character`));

addEventListener('keydown', (octopus) => console.log(`KEYDOWN. You pressed the ${octopus.key} character`));

// 6
addEventListener('keydown', (event) => {
	if (event.key === 'c' && event.ctrlKey) {
		console.log('Action Canceled!');
		
	}
});

addEventListener('click', (event) => {
	if (event.key === 'c' && event.ctrlKey) {
		console.log('Action Canceled!');
		
	}
});

// 7
const onceParagraph = document.getElementById('once');
onceParagraph.addEventListener('click', remove);

function remove(event) {
	console.log('Enjoy this while it lasts!');
	onceParagraph.style.backgroundColor = 'pink';
	onceParagraph.removeEventListener('click', remove);
}