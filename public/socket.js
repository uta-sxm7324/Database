const socket = io();

socket.on('data', function (table, data) {
    console.log(data);
    loadData(table, data);
});

socket.on('itemError', function (err) {
    console.log(err);
    //Probably a duplicate item id
    alert('Oops! There was an issue inserting your item.');
});

socket.on('itemSuccess', function () {
    alert('Success!');
});

window.onload = function () {
    console.log("Page loaded");
    socket.emit('getData');
};

function sendNewItem(json) {
    socket.emit('newItem', json);
}

function sendNewVendor(json) {
    socket.emit('newVendor',json);
}