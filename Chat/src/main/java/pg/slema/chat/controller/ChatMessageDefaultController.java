package pg.slema.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import pg.slema.chat.dto.ReceivedChatMessage;
import pg.slema.chat.function.ReceiveMessageAsChatMessageFunction;
import pg.slema.chat.mapper.ReceivedChatMessageConversationMapper;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.service.ConversationService;
import pg.slema.message.entity.Message;
import pg.slema.message.function.MessageToResponse;
import pg.slema.message.service.MessageService;

import java.util.Optional;
import java.util.UUID;

@Controller
public class ChatMessageDefaultController implements ChatMessageController {

    private final MessageService messageService;

    private final SimpMessagingTemplate messagingTemplate;

    private final ReceiveMessageAsChatMessageFunction receiveToMessage;

    private final MessageToResponse messageToResponse;

    @Autowired
    public ChatMessageDefaultController(MessageService messageService,
                                        SimpMessagingTemplate messagingTemplate,
                                        ReceiveMessageAsChatMessageFunction receiveToMessage,
                                        MessageToResponse messageToResponse) {
        this.messagingTemplate = messagingTemplate;
        this.messageService = messageService;
        this.receiveToMessage = receiveToMessage;
        this.messageToResponse = messageToResponse;
    }

    @Override
    public void handleChatMessage(ReceivedChatMessage receivedChatMessage, String conversationId) {
        UUID messageId = UUID.randomUUID();
        messageService.create(receiveToMessage.apply(messageId, receivedChatMessage));
        Optional<Message> createdMessage = messageService.find(messageId);
        createdMessage.ifPresent(message -> sendChatMessage(conversationId, message));
    }

    private void sendChatMessage(String conversationId, Message message) {
        messagingTemplate.convertAndSend("/topic/messages/" + conversationId,
                messageToResponse.apply(message));
    }
}
