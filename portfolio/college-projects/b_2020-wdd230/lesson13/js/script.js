// HAMBURGER MENU
function toggleMenu() {
	document.getElementById('primaryNav').classList.toggle('hide');
}

// MAP
// Initialize and add the map
function initMap() {
	// The location of Uluru
	var playaDelCarmenFerry = {lat: 20.510191, lng: -86.950499};
	var middlePoint = {lat: 20.496979, lng: -86.961525};
	var terminalPuertaMaya = {lat: 20.478194, lng: -86.972534};
	// The map, centered at Uluru
	var cozumel = new google.maps.Map(document.getElementById('map'), {zoom: 13, center: middlePoint});
	
	// The marker, positioned at Uluru
	var marker1 = new google.maps.Marker({
		position: terminalPuertaMaya,
		map: cozumel,
		label: {
			color: 'white',
			fontWeight: 'bold',
			fontSize: '1.8em',
			text: "1"
		}
	});
	
	var marker2 = new google.maps.Marker({
		position: playaDelCarmenFerry,
		map: cozumel,
		label: {
        color: 'white',
        fontWeight: 'bold',
        fontSize: '1.8em',
        text: "2"
	  	}
	});
}

// DATE: LAST UPDATE
const options = {
	weekday: 'long',
	day: 'numeric',
	month: 'long',
	year: 'numeric'
  };
  
  let date = new Date();
  let local = date.toLocaleDateString('en-US', options);
  /* EXAMPLE: Wednesday, 24 July 2020 */
  document.getElementById('currentDate').textContent = local;