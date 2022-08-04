const imgBasePath = "./images/";

// ------------------------------------------------------------------ ||
//#region class
export default class Hikes {

	constructor(hikeListParent, hikeList) {
		this.hikeListParentElement = hikeListParent,
			this.hikeList = hikeList;
	}

	showHikeList() {
		this.hikeListParentElement.innerHTML = '';
		renderHikeList(this.hikeList, this.hikeListParentElement);
	}
}
//#endregion

// ------------------------------------------------------------------ ||
//#region FUNCTIONS
function renderHikeList(hikesList, parent) {
	hikesList.forEach(hikeItem => {
		parent.appendChild(renderOneHike(hikeItem));
	});
}

function renderOneHike(hike) {
	const item = document.createElement("li");

	item.innerHTML = ` <h2>${hike.name}</h2>
        <div class="image"><img src="${imgBasePath}${hike.imgSrc}" alt="${hike.imgAlt}"></div>
        <div>
                <div>
                    <h3>Distance</h3>
                    <p>${hike.distance}</p>
                </div>
                <div>
                    <h3>Difficulty</h3>
                    <p>${hike.difficulty}</p>
                </div>
        </div>`;

	return item;
}
//#endregion




