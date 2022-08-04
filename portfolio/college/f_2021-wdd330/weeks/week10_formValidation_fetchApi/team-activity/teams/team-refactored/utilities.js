export function getJson(url) {
	return fetch(url)
		.then(response => {
			if (!response.ok) {
				throw Error(response.statusText);
			} else {
				return response.json();
			}
		}).catch(function (error) {
			console.log('Error is:');
			console.log(error);
		});
}

// https://developer.mozilla.org/en-US/docs/Web/API/Geolocation
// One thing to note is that the Geolocation API does not return a Promise like Fetch does.
export const getLocation = function (options) {
	return new Promise(function (resolve, reject) {
		navigator.geolocation.getCurrentPosition(resolve, reject, options);
	});

	// For testing purposes
	// San Francisco, California, area
	// return 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime=2020-01-01&endtime=2020-02-02&latitude=37.4013952&longitude=-122.9209344&maxradiuskm=100'
};

