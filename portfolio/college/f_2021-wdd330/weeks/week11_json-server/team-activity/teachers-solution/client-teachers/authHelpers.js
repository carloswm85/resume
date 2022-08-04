// 1
export class Errors {

  // 1.1
  constructor(errorElementId) {
    this.errorElement = document.getElementById(errorElementId);
  }

  // 1.2
  handleError(error, callback) {
    // parse out the error code from the error string
    const code = error.message.substring(0, 3);
    this.displayError(error);
    // if it is something related to authentication then show the login form again.
    if (code == 500 || code == 401) {
      callback();
    }
    console.log(code);
  }

  // 1.3
  displayError(error) {
    this.errorElement.innerHTML = error.message;
    this.errorElement.classList.remove('hidden');
  }

  // 1.4
  clearError() {
    this.errorElement.innerHTML = '';
    this.errorElement.classList.add('hidden');
  }
}

// 2.0
const baseURL = 'http://127.0.0.1:3000/';

// 3.0
// helper function to make an http request with fetch.
// returns a promise to a json object
export async function makeRequest(
  url,
  method = 'GET',
  body = null,
  token = null
) {

  // 3.1
  let options = {
    method: method,
    headers: {
      'Content-Type': 'application/json'
    }
  };

  // 3.2
  // if we are sending any data with the request add it here
  if (method == 'POST' || method == 'PUT') {
    options.body = JSON.stringify(body);
  }

  // 3.3
  // if a token was passed in we should send it on.
  if (token) {
    options.headers.Authorization = `Bearer ${token}`;
    console.log(`options.headers.Authorization → ${options.headers.Authorization}`);
  }

  // 3.4
  console.log('Before fetch()');  
  console.log(`options → ${options}`);
  console.log(`options.method → ${options.method}`);
  console.log(`options.headers → ${options.headers}`);
  console.log(`options.headers["Content-Type"] → ${options.headers["Content-Type"]}`);
  console.log(`options.body → ${options.body}`);
  const response = await fetch(baseURL + url, options);
  /**
   * Expected options:
   *    Method is put,
   *    header is 'Content-Type': 'application/json',
   * and body is {
     "email": "user1@email.com",
     "password": "user1"
   }
   **/
  
  // in this case we are processing the response as JSON before we check the status. The API will send back more meaningful error messages than the default messages in the response, but we have to convert it before we can get to them.

  // 3.5
  const data = await response.json();
  // console.log(data);    

  // 3.6
  if (!response.ok) {
    // server will send a 500 server error if the token expires...or a 401 if we are not authorized, ie bad username/password combination, and a 404 if the URL we requested does not exist. All of these would cause response.ok to be false
    throw new Error(`thrown error is: ${data.status} → ${data.message}`);


  } else {

    // 3.7
    return data;
  }
  // not catching the error here...so we will need to catch it later on and handle it.
}
