const express = require('express')
var mysql = require('mysql');
require('dotenv').config();

const app = express()
const port = 3000

var connection = mysql.createConnection({
  host     : process.env.DB_HOST,
  user     : process.env.DB_USERNAME,
  password : process.env.DB_PASSWORD,
  database : process.env.DB_NAME,
  port     : process.env.DB_PORT
});
app.get("/db", (req, res) => {

connection.connect(function(err) {
  if (err) {
	  res.send("db connection failed")

    console.error('Database connection failed: ' + err.stack);
    return;
 }
	res.send("db connection successful");
  console.log('Connected to database.');


connection.end();
});})


app.get('/', (req, res) => {
    res.send('Hello World from Sprints!')
  })
  
app.listen(port, () => {
   console.log(`Example app listening at http://localhost:${port}`)
})
