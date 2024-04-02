// Połączenie z serwerem WebSocket
var socket = new WebSocket('ws://localhost:8081/chat-register');
var stompClient = Stomp.over(socket);

// Funkcja do wywołania po nawiązaniu połączenia z serwerem WebSocket
function connect() {
    console.log('Nawiązano połączenie z serwerem WebSocket');

    // Subskrybowanie do określonego topicu (pokoju)
    stompClient.subscribe('/topic/messages', function(message) {
        var receivedMessage = JSON.parse(message.body);
        console.log('Otrzymano wiadomość:', receivedMessage);
        var messageDiv = document.createElement('div');
        messageDiv.textContent = receivedMessage.value;
        document.getElementById('message-container').appendChild(messageDiv);
    });
}

// Funkcja do wysyłania wiadomości do serwera WebSocket
function sendMessage() {
    var message = {
        value: document.getElementById('message-input').value,
        user: 'user123' // Zamiast 'user123' możesz wstawić nazwę użytkownika
    };
    console.log('Wysłano wiadomość:', message);
    stompClient.send('/app/chat', {}, JSON.stringify(message));
}

// Funkcja wywoływana w przypadku błędu połączenia z serwerem WebSocket
function onError(error) {
    console.error('Błąd połączenia z serwerem WebSocket:', error);
}

// Połączenie z serwerem WebSocket
socket.onopen = connect;
socket.onerror = onError;
var sendButton = document.getElementById('sendButton');

// Dodanie nasłuchiwania na zdarzenie kliknięcia przycisku "Wyślij"
sendButton.addEventListener('click', function() {
    sendMessage();
});