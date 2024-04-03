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

    private final ConversationService conversationService;

    private final SimpMessagingTemplate messagingTemplate;

    private final ReceiveMessageAsChatMessageFunction receiveToMessage;

    private final MessageToResponse messageToResponse;

    private final ReceivedChatMessageConversationMapper conversationMapper;

    @Autowired
    public ChatMessageDefaultController(MessageService messageService,
                                        ConversationService conversationService,
                                        SimpMessagingTemplate messagingTemplate,
                                        ReceiveMessageAsChatMessageFunction receiveToMessage,
                                        MessageToResponse messageToResponse,
                                        ReceivedChatMessageConversationMapper conversationMapper) {
        this.conversationService = conversationService;
        this.messagingTemplate = messagingTemplate;
        this.messageService = messageService;
        this.receiveToMessage = receiveToMessage;
        this.messageToResponse = messageToResponse;
        this.conversationMapper = conversationMapper;
    }

    @Override
    public void handleChatMessage(ReceivedChatMessage receivedChatMessage, String conversationId) {
        UUID messageId = UUID.randomUUID();
        Conversation conversation = getOrCreateNewConversationForMessage(receivedChatMessage);
        Message message = receiveToMessage.apply(messageId, receivedChatMessage);
        message.setConversation(conversation);
        messageService.create(message);
        Optional<Message> createdMessage = messageService.find(messageId);
        createdMessage.ifPresent(msg -> sendChatMessage(conversationId, msg));
    }

    private void sendChatMessage(String conversationId, Message message) {
        messagingTemplate.convertAndSend("/topic/messages/" + conversationId,
                messageToResponse.apply(message));
    }

    private Conversation getOrCreateNewConversationForMessage(ReceivedChatMessage message) {
        ReceivedChatMessage.Conversation messageConversation = message.getConversation();
        Optional<Conversation> conversation = conversationService.find(messageConversation.getId());
        if(conversation.isEmpty()) {
            Conversation createdConversation = conversationMapper.apply(message.getSenderId(), messageConversation);
            conversationService.create(createdConversation);
            return createdConversation;
        }
        else {
            return conversation.get();
        }
    }
}
