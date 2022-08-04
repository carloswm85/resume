console.log(23);

export default class ToDoController {
		
	constructor(parentId) {
		this.parentElement = document.getElementById(parentId);


	}

	// 
	displayList() {
		console.log(23);
		this.parentElement.innerHTML = "<p>This text comes from JS. Delete the id for this form element to see the actual ToDo list styled sample. Not from scripting, only HTML+CSS for that.</p><p>There's a lot of work ahead.</p>";
	}

	// 
	createTask() {

	}

	// 
	removeTask() {

	}

	// 
	viewTask() {

	}

	// check and uncheck
	toggleTask() {

	}

	// filter by complete/not complete
	filterList() {

	}

	// 
	addListListener() {

	}
}
