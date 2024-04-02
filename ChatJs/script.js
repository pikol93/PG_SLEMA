
// Połączenie z serwerem WebSocket

var client;
var userName;
var conversationId;


function connect(roomId) {
    var client = new StompJs.Client({
        brokerURL: 'ws://localhost:8081/chat-register',
        reconnectDelay: 5000,
        heartbeatIncoming: 4000,
        heartbeatOutgoing: 4000,
        onConnect: () => client.subscribe(`/topic/messages/${roomId}`, message => {
            console.log(message);
            var receivedMessage = JSON.parse(message.body);
            console.log('Otrzymano wiadomość:', receivedMessage);
            var messageDiv = document.createElement('div');
            messageDiv.textContent = receivedMessage.user + ": " + receivedMessage.value;
            document.getElementById('message-container').appendChild(messageDiv);
          })
    })
    var userName = document.getElementById('user-name').value;
    client.activate();
    return {client: client, userName: userName}
}

function disconnect(client) {
    client.deactivate();
}

function sendMessage(client, userName, roomId) {
    var message = {
        value: document.getElementById('message-input').value,
        user: userName
    };
    console.log('Wysłano wiadomość:', message);
    client.publish({
        destination: `/app/chat/${roomId}`,
        body: JSON.stringify(message),
        headers: {}
    })
}


var sendButton = document.getElementById('sendButton');
sendButton.addEventListener('click', function() {
    if(client != undefined)
    sendMessage(client, userName, conversationId);
});

var connectButton = document.getElementById('connectButton');
connectButton.addEventListener('click', function() {
    conversationId = document.getElementById('conversation-id').value;
    if (!conversationId.trim()) {
        console.log("pusty room")
        return;
    }
    var x = connect(conversationId);
    client = x.client;
    userName = x.userName;
    console.log("połączono")
});

var disconnectButton = document.getElementById('disconnectButton');
disconnectButton.addEventListener('click', function() {
    if(client != undefined)
    disconnect(client);
    client = undefined
    console.log("rozłączono")
});

