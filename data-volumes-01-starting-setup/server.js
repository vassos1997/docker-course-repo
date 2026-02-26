const fs = require('fs').promises; // promise based file system which means that we can use async/await
const exists = require('fs').exists;
const path = require('path');

const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.urlencoded({ extended: false })); 

app.use(express.static('public'));
app.use('/feedback', express.static(path.join(__dirname, 'feedback')));

app.get('/', (req, res) => { // this is the route handler for the root URL ("/"). When a user accesses the root URL, this function will be executed.
  const filePath = path.join(__dirname, 'pages', 'feedback.html');
  res.sendFile(filePath);
});

app.get('/exists', (req, res) => { // this is the route handler for /exists URL ("/exists"). When a user accesses the /exists URL, this function will be executed.
  const filePath = path.join(__dirname, 'pages', 'exists.html');
  res.sendFile(filePath);
});

function asyncHandler(fn) {
  return (req, res, next) =>
    Promise.resolve(fn(req, res, next)).catch(next);
}

app.post('/create', asyncHandler(async (req, res) => {
  const title = req.body.title;
  const content = req.body.text;

  const finalFilePath = path.join(__dirname, 'feedback', title + '.txt');

  console.log("finalFilePath", finalFilePath);
  console.log("a file has been created");
 

  await fs.writeFile(finalFilePath, content, { flag: 'wx' });

  res.redirect('/');
}));

app.listen(80);
