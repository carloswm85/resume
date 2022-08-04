
/**
 * INDEX
 */
const list = document.querySelector('#list');
const links = [
	{
		label: 'Week 01 - Intro, localStorage',
		url: 'weeks/week01_introduction/'
	},
	{
		label: 'Week 02 - Basics',
		url: 'weeks/week02_basics/'
	},
	{
		label: 'Week 03 - Objects, this, events, DOM',
		url: 'weeks/week03_this_objects_doms_events/'
	},
	{
		label: 'Week 04 - OOP, Forms',
		url: 'weeks/week04_forms_oop/'
	},
	{
		label: 'Week 05 - Testing and Debugging',
		url: 'weeks/week05_testing-debugging/'
	},
	{
		label: 'Week 06 - Project 1',
		url: 'weeks/week06_todo_list_project/'
	},
	{
		label: 'Week 07 - Callbacks, AJAX, Async, Promises',
		url: 'weeks/week07_ajax/'
	},
	{
		label: 'Week 08 - AJAX, Animations, Canvas, Drag & Drop',
		url: 'weeks/week08_ajax_animations_canvas_dragndrop/'
	},
	{
		label: 'Week 09 - Parcel, Window Object, HTML5 APIs, Front-End Workflow',
		url: 'weeks/week09_parcel-boilerplate/'
	},
	{
		label: 'Week 10 - Form Validation, Fetch API',
		url: 'weeks/week10_formValidation_fetchApi/'
	},
	{
		label: 'Week 11 - JSON Server',
		url: 'weeks/week11_json-server/'
	},
	{
		label: 'Week 12 - Show and Tell',
		url: 'weeks/week12_show-and-tell/'
	},
	{
		label: 'Week 13 - I have no idea',
		url: 'weeks/week13/'
	}
]

links.forEach(element => {
	var listItem = document.createElement('li');
	var linkElement = document.createElement('a');
	var span = document.createElement('span');
	
	linkElement.target = '_blank';
	linkElement.href = element.url;
	linkElement.innerText = element.label;

	// &nearr; &UpperRightArrow; &nearrow; &#x02197; &#8599;
	span.innerHTML = ' &#8663;';

	linkElement.appendChild(span);
	listItem.appendChild(linkElement);
	list.appendChild(listItem);
});
