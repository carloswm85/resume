// 1
export function getJSON(url) {
  return fetch(url)
    .then(function(response) {
      if (!response.ok) {
        throw Error(response.statusText);
      } else {
        //console.log(response.json());
        return response.json();
      }
    })
    .catch(function(error) {
      console.log(error);
    });
}

// 2
export const getLocation = function (options) {
  myPromise = new Promise(function(resolve, reject) {
    navigator.geolocation.getCurrentPosition(resolve, reject, options);
    console.log('getLocation');
    console.log(resolve);
    console.log(reject);    
  });
  console.log(myPromise);  
  return myPromise;
};
