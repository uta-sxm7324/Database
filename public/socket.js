// Samuel Mach 1002107324
// Abubakar Kassim 1002158809

const socket = io();

socket.on('data', function (table, data) {
    console.log(data);
    loadData(table, data);
});

socket.on('err', (type, err) => {
    console.log('There was an error processing ', type);
    console.log(err);
})

socket.on('success', function (type) {
    console.log(type + ' succeeded');
    alert('Success!');
});


window.onload = function () {
    console.log("Page loaded");
    socket.emit('getData');
};

function sendReset() {
    socket.emit('reset');
}

function sendNewItem(json) {
    socket.emit('newItem', json);
}

function sendNewVendor(json) {
    socket.emit('newVendor',json);
}

function fetchStoreOne() {
    socket.emit('fetchStoreOne');
}

function sendUpdatePrice(json) {
    socket.emit('updatePrice', json);
}

function sendDeleteItem(json) {
    socket.emit('deleteItem', json);
}

function sendFetch(json) {
    socket.emit('topk', json);
}

function sendTotalRevenue() {
    socket.emit('totalRevenue');
}

function sendFetchMoreThan(json) {
    socket.emit('moreThan', json);
}

function sendFetchHighestLoyalty() {
    socket.emit('highestLoyalty');
}

function sendLoyaltyBetween(json) {
    socket.emit('loyaltyBetween', json);
}