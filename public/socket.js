const socket = io();

socket.on('data', function (data) {
    console.log(data);
});