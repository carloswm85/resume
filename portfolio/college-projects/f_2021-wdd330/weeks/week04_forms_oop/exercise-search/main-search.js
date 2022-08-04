// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Selecting the Form
const form = document.forms[0];
const formOptional = document.getElementsByTagName('form')[0];
const formOptional2 = document.forms.search; // selection through the name attribute
const formOptional3 = document.forms['search'];

const [input, button] = form.elements;
const input0 = form.searchInput;
const inputOptional = form['searchInput'];


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Properties and Methods
/**
 * form.submit();
 * form.reset();
 * form.action = '/an/other.url';
 */

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Form Events
const input2 = form.elements.searchInput2;
const input3 = form.elements.searchInput3;
input2.addEventListener('focus', () => alert('focused'), false); // Getting in
input3.addEventListener('blur', () => alert('blurred'), false); // Getting out
input3.addEventListener('change', () => alert('changed'), false); // When content field WAS changed

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Submitting a Form
const form2 = document.forms['search'];
form2.addEventListener('submit', search, false);

const input4 = form.elements.searchInput4;
input4.value = 'Search Here';

/**
 	After you click OK, the browser tries to load a nonexistent page (the URL should end in something similar to	.../search?searchInput3=hello). This is because when the event fired, our search()	function was invoked, displaying the alert dialog.Then the form was submitted to the URL provided in the action attribute for processing, but in this	case, the URL isn’ t a real URL, so it doesn’ t go anywhere.Back - end processing isn’ t covered in this book, so we’ ll keep this as a dummy URL and focus on using JavaScript to process the information instead.

	 		../search?searchInput3=hello ← it's a dummy URL
			search						← folder
			search/index.html ← non-existing page
			searchInput3			← name of the input form control
			hello							← string value from searchInput3
 */

function search(event) {
	alert(`You've searched for ${input3.value}`);
	event.preventDefault(); // this line prevents the form from being sent, and the current page from being changed
}

input4.addEventListener('focus', function () {
	if (input4.value === 'Search Here') {
		input4.value = '';
	}
} , false); // Getting in

input4.addEventListener('blur', function () {
	if (input.value === '') {
		input4.value = 'Search Here';
	}
}, false); // Getting out