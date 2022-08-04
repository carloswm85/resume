/**
 * LAST EDIT
 */
const lastEdit = document.querySelector(".last-edit");
const theDate = new Date(document.lastModified).toLocaleDateString();
lastEdit.innerText = theDate;


/** ------------------------------------------------------------------------
 * Team Activity
 --------------------------------------------------------------------------- */
let button = document.getElementById('button');
let cont = document.querySelector('.empty-container');
 
button.addEventListener('click', () => {
	 cont.innerText = addNumbers();	 
});
	
function addNumbers() {
	let text = parseFloat(document.getElementById('input').value);
	let text2 = parseFloat(document.getElementById('input2').value);
	let sum = text + text2;
	return sum;
}

