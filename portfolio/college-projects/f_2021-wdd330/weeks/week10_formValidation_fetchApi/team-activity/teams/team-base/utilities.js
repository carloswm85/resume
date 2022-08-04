// The EXPORT keyword makes this file a "module".


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 01
/**
 * Fetch was designed to treat any request that communicates successfully with the
 * intended destination server as successful, no matter what the response is! So we
 * need to add more checking to make sure we actually got the results we were looking
 * for before we try to use them.
 */
export function getJson(url) {
	return fetch(url)
		.then(response => {
			if (!response.ok) {
				throw Error(response.statusText);
			} else {
				return response.json();
			}
		})
		.catch(function (error) {
			console.log(error);
		})
}


// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 02
// The Geolocation API does not return a Promise like Fetch does.
export const getLocation = function (options) {
	return new Promise(function (resolve, reject) {
		navigator.geolocation.getCurrentPosition(resolve, reject, options);
	});
};
// https://developer.mozilla.org/en-US/docs/Web/API/Geolocation_API
