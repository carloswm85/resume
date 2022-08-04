import ToDoController from './model/todos.js';

const myToDoController = new ToDoController('todos');

window.addEventListener('load', () => {
	myToDoController.displayList();
});
