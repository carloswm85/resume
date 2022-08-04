const fs = require('fs');
const jsonServer = require('json-server');
const jwt = require('jsonwebtoken');
const bodyParser = require('body-parser');
const server = jsonServer.create();
const router = jsonServer.router('./database.json');

server.use(bodyParser.urlencoded({ extended: true }));
server.use(bodyParser.json());
server.use(jsonServer.defaults());

const SECRET_KEY = '123456789';

// token timeout is set here
const expiresIn = '1m';

// 1
// Create a token from a payload
function createToken(payload) {
  console.log('Server 1');  
  return jwt.sign(payload, SECRET_KEY, { expiresIn });
}

// 2
// Verify the token
function verifyToken(token) {
  console.log('Server 2');  
  return jwt.verify(token, SECRET_KEY, (err, decode) => {
    if (err) {
      throw Error(err);
    } else {
      return decode;
    }
  });
}

// 3
// Check if the user exists in database
function isAuthenticated({ email, password }) {
  console.log('Server 3');
  return (
    // userdb.users.findIndex(user => user.username === username && user.password === password) !== -1
    router.db
      .get('users')
      .findIndex(user => user.email === email && user.password === password)
      .value() !== -1
  );
}

// 4
server.post('login', (req, res) => {
  // console.log(`req.body → ${req.body}`);
  console.log('Server 4');
  const { email, password } = req.body;
  if (isAuthenticated({ email, password }) === false) {
    const status = 401;
    const message = 'Incorrect username or password';
    res.status(status).json({ status, message });
    return;
  }
  const accessToken = createToken({ email, password });
  res.status(200).json({ accessToken });
});

// 5
server.use((req, res, next) => {
  console.log('Server 5');
  
  if (req.method === 'POST') {
    const { authorization } = req.headers;
    // console.log(authorization);
    // console.log(req.headers);

    if (authorization) {
      const [scheme, token] = authorization.split(' ');
      //jwt.verify(token, 'json-server-auth-123456');
      // Add claims to request
      req.claims = verifyToken(token);
      req.body.userId = req.claims.email;
    }
    req.body.createdAt = Date.now();
  }
  // Continue to JSON Server router
  next();
});

// 6
server.use(/^(?!\/auth).*$/, (req, res, next) => {
  console.log('Server 6');
  console.log(req.headers);
  console.log(typeof req.headers.authorization);
  
  if (
    req.headers.authorization === undefined ||
    req.headers.authorization.split(' ')[1] !== 'Bearer'
  ) {
    const status = 401;
    const message = 'Error in authorization format (json-server)';
    res.status(status).json({ status, message });
    return;
  }
  try {
    console.log('checking token');
    verifyToken(req.headers.authorization.split(' ')[1]);

    next();
  } catch (err) {
    const status = 401;
    const message = err.message;
    res.status(status).json({ status, message });
  }
});

// 7
server.use(router);

// 8
// This is the address where the server will be run, NOT the client!
server.listen(3000, () => {
  console.log('Run Auth API Server (← server.js)');
});
