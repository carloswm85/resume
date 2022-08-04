// Last time page code was updated/changed
function lastUpdate()
{
	const options = {
		year: "numeric",
		month: "long",
		weekday: "long",
		day: "numeric",
		hour: "numeric",
		minute: "numeric",
		//second: "numeric",
		hour12: true
	};

	let last = document.lastModified;
	let date = new Date(last);
	let local = date.toLocaleDateString("en-US", options);
	let fullDate = `${local}`;
	
	try {
		document.getElementById("updated").textContent = fullDate;
	} catch {
		console.log("Hey, babe");
	}
}

function currentYear() {
	let year = new Date().getFullYear();

	try {
		document.getElementById("currentYear").textContent = year;
	} catch {
		console.log("Hey, babe");
	}
}

export { lastUpdate, currentYear };