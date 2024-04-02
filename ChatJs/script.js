
// Połączenie z serwerem WebSocket
var client = new StompJs.Client({
    brokerURL: 'ws://localhost:8081/chat-register',
    reconnectDelay: 5000,
    heartbeatIncoming: 4000,
    heartbeatOutgoing: 4000,
    onConnect: () => client.subscribe('/topic/messages', message => {
        console.log(message);
        var receivedMessage = JSON.parse(message.body);
        console.log('Otrzymano wiadomość:', receivedMessage);
        var messageDiv = document.createElement('div');
        messageDiv.textContent = receivedMessage.user + ": " + receivedMessage.value;
        document.getElementById('message-container').appendChild(messageDiv);
      })
})

function sendMessage() {
    var message = {
        value: document.getElementById('message-input').value,
        user: 'user123' // Zamiast 'user123' możesz wstawić nazwę użytkownika
    };
    console.log('Wysłano wiadomość:', message);
    client.publish({
        destination: '/app/chat',
        body: JSON.stringify(message),
        headers: {}
    })
}


var sendButton = document.getElementById('sendButton');
sendButton.addEventListener('click', function() {
    sendMessage();
});

client.activate();
