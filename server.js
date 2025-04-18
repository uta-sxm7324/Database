// Samuel Mach 1002107324
// Abubakar Kassim 1002158809

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

Database.connection = con;
Database.init();


// Web serving
app.use(express.static(__dirname + '/public'));

const server = http.createServer(app);
const io = new Server(server);

function sendAll(socket) {
    Database.getTable("item", (err, data) => {
        if (err) return console.log(err);
        console.log('Sending item data');
        socket.emit('data','item',data);
    });

    Database.getTable("vendor", (err, data) => {
        if (err) return console.log(err);
        console.log('Sending vendor data');
        socket.emit('data','vendor',data);
    });
}

io.on('connection', (socket) => {
    console.log('New connection:', socket.id);
  
    socket.on('getData', () => {
        sendAll(socket);
    });

    socket.on('newItem', (json) => {
        Database.insertItem(json, (err, data) => {
            if (err) {
                //Bad data (most likely duplicate item)
                socket.emit('err', 'item', err);

            } else {
                console.log('Added item');
                socket.emit('success', 'item');
                socket.emit('data','item',data);
            }
        })
    });

    socket.on('newVendor', (json) => {
        Database.insertVendor(json, (err, data) => {
            if (err) {
                //Bad data (most likely duplicate id)
                socket.emit('err', 'vendor', err);

            } else {
                console.log('Added vendor');
                socket.emit('success', 'vendor');
                socket.emit('data','vendor',data);
            }
        })
    });

    socket.on('fetchStoreOne', () => {
        Database.getStore(1, (err, data) => {
            if (err) {
                //Bad data (most likely duplicate id)
                socket.emit('err', 'store', err);
            } else {
                console.log('Fetched store');
                socket.emit('success', 'store');
                socket.emit('data','store',data);
            }
        })
    });

    socket.on('topk', (json) => {
        Database.topk(json, (err, data) => {
            if (err) {
                //Bad data (most likely duplicate id)
                socket.emit('err', 'topk', err);
            } else {
                console.log('Fetched top k');
                socket.emit('success', 'topk');
                socket.emit('data','topk',data);
            }
        })
    })

    socket.on('totalRevenue', () => {
        const type = 'totalRevenue'
        Database.totalRevenue((err, data) => {
            if (err) {
                //Bad data (most likely duplicate id)
                socket.emit('err', type, err);
            } else {
                console.log('Fetched ' + type);
                socket.emit('success', type);
                socket.emit('data',type,data);
            }
        })
    })

    socket.on('moreThan', (json) => {
        const type = 'moreThan'
        Database.moreThan(json, (err, data) => {
            if (err) {
                //Bad data (most likely duplicate id)
                socket.emit('err', type, err);
            } else {
                console.log('Fetched ' + type);
                socket.emit('success', type);
                socket.emit('data',type,data);
            }
        })
    })

    socket.on('highestLoyalty', () => {
        const type = 'highestLoyalty'
        Database.highestLoyalty((err, data) => {
            if (err) {
                //Bad data (most likely duplicate id)
                socket.emit('err', type, err);
            } else {
                console.log('Fetched ' + type);
                socket.emit('success', type);
                socket.emit('data',type,data);
            }
        })
    })

    socket.on('loyaltyBetween', (json) => {
        const type = 'loyaltyBetween'
        Database.loyaltyBetween(json, (err, data) => {
            if (err) {
                //Bad data (most likely duplicate id)
                socket.emit('err', type, err);
            } else {
                console.log('Fetched ' + type);
                socket.emit('success', type);
                socket.emit('data',type,data);
            }
        })
    })

    socket.on('updatePrice', (json) => {
        console.log('Updating price...');
        Database.updatePrice(json, (err) => {
            if (err) {
                //Bad data (most likely invalid id)
                socket.emit('err', 'price', err);
                console.log(err);
            } else {
                console.log('Updated price');
                socket.emit('success', 'price');
                sendAll(socket);
            }
        })
    })

    socket.on('deleteItem', (json) => {
        console.log('Deleting item...');
        Database.deleteItem(json, (err) => {
            if (err) {
                //Bad data (most likely invalid id)
                socket.emit('err', 'delete', err);

            } else {
                console.log('Deleted Item');
                socket.emit('success', 'delete');
                sendAll(socket);
            }
        })
    })

    socket.on('reset', () => {
        //Drop the database :)
        Database.reset((err) => {
            if (err) return console.log(err);
            sendAll(socket);
        });
    })
  
    socket.on('disconnect', () => {
      console.log('User disconnected:', socket.id);
    });
  });

server.listen(8100, () => {
    console.log('Listening at http://localhost:8100/');
});