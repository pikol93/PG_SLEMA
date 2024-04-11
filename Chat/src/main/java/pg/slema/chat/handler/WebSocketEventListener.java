package pg.slema.chat.handler;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionSubscribeEvent;
import pg.slema.chat.dto.ChatContent;
import pg.slema.chat.function.ChatContentToResponse;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.service.ConversationService;
import pg.slema.message.entity.Message;
import pg.slema.message.service.MessageService;
import pg.slema.user.entity.User;

import java.security.Principal;
import java.util.*;
import java.util.stream.Collectors;

@Component
public class WebSocketEventListener {

    private final MessageService messageService;

    private final ConversationService conversationService;

    private final SimpMessagingTemplate messagingTemplate;

    private final ChatContentToResponse chatContentToResponse;

    @Autowired
    public WebSocketEventListener(MessageService messageService,
                                  ConversationService conversationService,
                                  SimpMessagingTemplate messagingTemplate,
                                  ChatContentToResponse chatContentToResponse) {
        this.messageService = messageService;
        this.conversationService = conversationService;
        this.messagingTemplate = messagingTemplate;
        this.chatContentToResponse = chatContentToResponse;
    }

    @Transactional
    @EventListener
    public void handleWebSocketConnectionListener(SessionSubscribeEvent event) {
        SimpMessageHeaderAccessor headers = SimpMessageHeaderAccessor.wrap(event.getMessage());
        if(isItSubscribeForChatContent(headers)) {
            String destination = createDestinationFromHeader(Objects.requireNonNull(headers.getDestination()));
            Principal user = headers.getUser();
            sendInformationAboutChatContent(destination, Objects.requireNonNull(user));
        }
    }

    private boolean isItSubscribeForChatContent(SimpMessageHeaderAccessor headers) {
        return headers.getDestination() != null
                && headers.getUser() != null
                && headers.getDestination().startsWith("/user/topic/history");
    }

    private void sendInformationAboutChatContent(String destination, Principal user) {
        String userName = user.getName();
        String[] destinationArr = destination.split("/");
        String conversationId = destinationArr[destinationArr.length-1];
        try {
            ChatContent history = createChatContentForConversation(UUID.fromString(conversationId));
            messagingTemplate.convertAndSendToUser(userName, destination, history);
        } catch (IllegalArgumentException ignored) {
        }
    }

    private ChatContent createChatContentForConversation(UUID conversationId) {
        Optional<Conversation> conversation = conversationService.find(conversationId);
        if(conversation.isEmpty()) {
            throw new IllegalArgumentException("Incorrect conversation ID");
        }

        List<User> users = new LinkedList<>(conversation.get().getParticipants());
        users.add(0, conversation.get().getInitiator());

        List<Message> messages = messageService.findAllByConversation(conversationId);
        return chatContentToResponse.apply(conversation.get(), users, messages);
    }

    private String createDestinationFromHeader(String destination) {
        return  "/" + Arrays.stream(destination.split("/"))
                .skip(2)
                .collect(Collectors.joining("/"));
    }
}
