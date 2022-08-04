const form = document.forms['hero'];

form.addEventListener('submit', makeHero, false);
form.addEventListener('submit', validate, false);
form.addEventListener('keyup', validateInline, false);
form.heroName.addEventListener('keyup', disableSubmit, false);

form.powers[0].checked = true;
form.category[2].checked = true;

// 01
function makeHero(event) {
	event.preventDefault(); // prevent the form from being submitted
	const hero = {}; // create an empty object literal

	hero.name = form.heroName.value; // create a name property based on the input field 's value
	hero.surname = form.heroSurname.value;
	hero.realName = form.realName.value;
	hero.powers = [];
	hero.category = form.category.value;
	hero.age = form.age.value;
	
	hero.city = form.city.value;
	// Optionally:
	// form.city.options[form.city.selectedIndex].text;
	// form.city.options[0].text;

	hero.origin = form.origin.value;

	for (let i = 0; i < form.powers.length; i++) {
		if (form.powers[i].checked) {
			hero.powers.push(form.powers[i].value);
		}		
	}
	// or:
	// hero.powers = [...form.powers].filter(box => box.checked).map(box => box.value);
	// ... is the spread operator
	
	alert(JSON.stringify(hero)); // convert object to JSON string and display in alert dialog
	return hero;
}

// 02
function validate(event) {
	const firstLetter = form.heroName.value[0];
	if (firstLetter.toUpperCase() === 'Y') {
		event.preventDefault();
		alert('Your name is not allowed to start with Y!');
	}
}

// 03
const label = form.querySelector('#surname');
const error = document.createElement('span');
error.classList.add('error');
error.textContent = '! Your surname is not allowed to start with X.';
label.append(error);

function validateInline() {
	const heroSurname = form.heroSurname.value.toUpperCase();
	if (heroSurname.startsWith('X')) {
		error.style.display = 'block';
	} else {
		error.style.display = 'none';
	}
}

// 04
function disableSubmit(event) {
	if (event.target.value === '') {
		document.getElementById('submit').disabled = true;
	} else {
		document.getElementById('submit').disabled = false;
	}
}