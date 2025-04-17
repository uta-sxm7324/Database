const http = require('http');
const mysql = require('mysql'); 
const express = require('express');
const app = express();
const { Server } = require('socket.io');

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

const server = http.createServer(app);
const io = new Server(server);

io.on('connection', (socket) => {
    console.log('New connection:', socket.id);
  
    socket.on('message', (msg) => {
      console.log('Message:', msg);
    });
  
    socket.on('disconnect', () => {
      console.log('User disconnected:', socket.id);
    });
  });

server.listen(8100, () => {
    console.log('Listening at http://localhost:8100/');
});