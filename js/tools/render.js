/**
 * Render the array of html files, to the
 * selected container.
 * @param {*} pages array of html file names
 * @param {*} container HTML element name
 */
function render(pages, container) {
	const template = document.createElement("template");
	var ajax = new XMLHttpRequest();

	pages.forEach(element => {
		ajax.open("GET", `./view/shared/${element}.html`, false);
		ajax.send();
		template.innerHTML += ajax.responseText;
	});

	document.querySelector(container).append(template.content);
}

export { render };