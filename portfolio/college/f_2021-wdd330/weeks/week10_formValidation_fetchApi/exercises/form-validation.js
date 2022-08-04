// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 1
	const email = document.getElementById("mail");

	email.addEventListener("input", function (event) {
		if (email.validity.typeMismatch) {
			email.setCustomValidity("I am expecting an e-mail address, dude!");
		} else {
			email.setCustomValidity("");
		}
	});



// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 2
// There are many ways to pick a DOM node; here we get the form itself and the email
// input box, as well as the span element into which we will place the error message.

const form2 = document.getElementsByTagName('form')[1]; // form from the 2nd example
console.log(`form2 → ${form2}`);

const email2 = document.getElementById('mail2'); // get the input element
const emailError2 = document.querySelector('#mail2 + span.error');

email2.addEventListener('input', function (event) {
	// EACH TIME the user types something, we check if the
	// form fields are valid.

	if (email2.validity.valid) {
		// In case there is an error message visible, if the field
		// is valid, we remove the error message.
		emailError2.textContent = ''; // Reset the content of the message
		emailError2.className = 'error'; // Reset the visual state of the message
	} else {
		// If there is still an error, show the correct error
		showError();
	}
});

form2.addEventListener('submit', function (event) {
	// if the email field is valid, we let the form submit

	if (!email2.validity.valid) {
		// If it isn't, we display an appropriate error message
		showError();
		
		// Then we prevent the form from being sent by canceling the event
		event.preventDefault();
	}
});

function showError() {
	if (email2.validity.valueMissing) {
		// If the field is empty,
		// display the following error message.
		emailError2.textContent = 'You need to enter an e-mail address, dude. (error1)';
	} else if (email2.validity.typeMismatch) {
		// If the field doesn't contain an email address,
		// display the following error message.
		emailError2.textContent = 'Entered value needs to be an e-mail address, bro. (error2)';
	} else if (email2.validity.tooShort) {
		// If the data is too short,
		// display the following error message.
		emailError2.textContent = `Email should be at least ${ email2.minLength } characters; you entered ${ email2.value.length }, man (error3)`;
	}

	// Set the styling appropriately
	emailError2.className = 'error active';
}
