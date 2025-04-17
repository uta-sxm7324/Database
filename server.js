const mysql = require('mysql'); 
const express = require('express');
const app = express();

const Database = require('./Database');

const con = mysql.createConnection({
    host: "localhost:3306",
    user: "server",
    //password: "yourpassword" //No password :)
});

con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});

const db = new Database(con);
db.init();


// Web serving
app.use(express.static(__dirname + '/public'));