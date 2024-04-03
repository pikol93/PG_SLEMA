
// Połączenie z serwerem WebSocket

var client;
var conversationId;
var userId;

function clearHistory() {
    var history = document.getElementById('message-container');
    history.innerHTML = '';
}

function formatDate(dateTimeStr) {
    const currentDate = new Date();
    const messageDate = new Date(`${dateTimeStr}`);

    const diffTimeMs = Math.abs(currentDate.getTime() - messageDate.getTime()); 
    const diffDays = Math.floor(diffTimeMs / (1000 * 60 * 60 * 24));

    if (diffDays === 0) {
        return "Dziś";
    } else if (diffDays <= 7) {
        const daysOfWeek = ["NDZ", "PON", "WT", "ŚR", "CZW", "PT", "SOB"];
        const dayOfWeekIndex = messageDate.getDay();
        return daysOfWeek[dayOfWeekIndex];
    } else {
        const year = messageDate.getFullYear();
        const month = messageDate.getMonth() + 1;
        const day = messageDate.getDate();
        return `${day}.${month}.${year}`;
    }
}

function formatTime(dateTimeStr) {
    const dateTime = new Date(`${dateTimeStr}`);
    const hours = ('0' + dateTime.getHours()).slice(-2);
    const minutes = ('0' + dateTime.getMinutes()).slice(-2);
    return `${hours}:${minutes}`;
}

function toIsoString(date) {
    var tzo = -date.getTimezoneOffset(),
        dif = tzo >= 0 ? '+' : '-',
        pad = function(num) {
            return (num < 10 ? '0' : '') + num;
        };
  
    return date.getFullYear() +
        '-' + pad(date.getMonth() + 1) +
        '-' + pad(date.getDate()) +
        'T' + pad(date.getHours()) +
        ':' + pad(date.getMinutes()) +
        ':' + pad(date.getSeconds()) +
        dif + pad(Math.floor(Math.abs(tzo) / 60)) +
        ':' + pad(Math.abs(tzo) % 60);
  }

function getMessageText(message) {
    console.log(message)
    return `${message.sender.name} ${formatDate(message.dateTime)} ${formatTime(message.dateTime)} \n ${message.content}`;
}

function appendNewMessage(messageContainer, message) {
    var messageDiv = document.createElement('div');
    messageDiv.textContent = getMessageText(message);
    messageContainer.appendChild(messageDiv);
}

function connect() {
    var conversationId = document.getElementById('conversation-id').innerHTML;
    var client = new StompJs.Client({
        brokerURL: 'ws://localhost:8081/chat-register',
        reconnectDelay: 5000,
        heartbeatIncoming: 4000,
        heartbeatOutgoing: 4000,
        onConnect: function() {
            client.subscribe(`/user/topic/messages/${conversationId}`, receivedMessage => {
            console.log(receivedMessage);
            var receivedMessageBody = JSON.parse(receivedMessage.body);
            console.log('Otrzymano historię');
            var messages = receivedMessageBody.messages;
            var messageContainer = document.getElementById('message-container');
            messages.forEach(function(message) {
                appendNewMessage(messageContainer, message);
            });
          })

          client.subscribe(`/topic/messages/${conversationId}`, receivedMessage => {
            console.log(receivedMessage);
            var message = JSON.parse(receivedMessage.body);
            var messageContainer = document.getElementById('message-container');
            appendNewMessage(messageContainer, message);
          })
        },
        onWebSocketClose: () => {
            clearHistory();
        },

        onDisconnect: () => {

        }
    })
    var userId = document.getElementById('user-id').innerHTML; 
    return {client: client, userId: userId, conversationId: conversationId}
}

function disconnect(client) {
    client.deactivate();
}

function sendMessage(client, senderId, roomId) {
    var currentDate = new Date();
    var message = {
        content: document.getElementById('message-input').value,
        senderId: senderId,
        conversation: {
            id: roomId,
            title: 'Default random name'
        },
        dateTime: currentDate
    };

    console.log(currentDate)
console.log(toIsoString(currentDate))
    console.log('Wysłano wiadomość:', message);
    client.publish({
        destination: `/app/chat/${roomId}`,
        body: JSON.stringify(message),
        headers: {}
    })
}


var sendButton = document.getElementById('sendButton');
sendButton.addEventListener('click', function() {
    console.log(userId)
    if(client != undefined)
    sendMessage(client, userId, conversationId);
});

var connectButton = document.getElementById('connectButton');
connectButton.addEventListener('click', function() {
    if(client != undefined) {
        return;
    }
    var x = connect(conversationId);
    client = x.client;
    userId = x.userId;
    conversationId = x.conversationId;
    if (!conversationId.trim()) {
        console.log("pusty room")
        return;
    }
    client.activate();
    console.log("połączono")
});

var disconnectButton = document.getElementById('disconnectButton');
disconnectButton.addEventListener('click', function() {
    if(client != undefined) {
        disconnect(client);
        client = undefined
        console.log("rozłączono")
    }
});

