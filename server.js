const http = require('http');
const mysql = require('mysql'); 
const express = require('express');
const app = express();
const { Server } = require('socket.io');

const Database = require('./Database');

const con = mysql.createConnection({
    host: "localhost",
    user: "server",
    multipleStatements: true //bad practice
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
  
    socket.on('getData', () => {
        db.getTable("item", (err, data) => {
            if (err) return console.log(err);
            console.log('Sending data');
            socket.emit('data','item',data);
        });
        
    });

    socket.on('reset', () => {
        //Drop the database :)
        db.reset((err) => {
            if (err) return console.log(err);
        });
    })
  
    socket.on('disconnect', () => {
      console.log('User disconnected:', socket.id);
    });
  });

server.listen(8100, () => {
    console.log('Listening at http://localhost:8100/');
});