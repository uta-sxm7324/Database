const socket = io();

socket.on('data', function (table, data) {
    console.log(data);
    loadData(table, data);
});

window.onload = function () {
    console.log("Page loaded");
    socket.emit('getData');
};