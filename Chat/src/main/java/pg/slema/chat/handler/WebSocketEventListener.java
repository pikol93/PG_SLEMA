package pg.slema.chat.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionSubscribeEvent;
import pg.slema.message.dto.GetMessagesResponse;
import pg.slema.message.function.MessagesToResponse;
import pg.slema.message.service.MessageService;

import java.security.Principal;
import java.util.Arrays;
import java.util.Objects;
import java.util.UUID;
import java.util.stream.Collectors;

@Component
public class WebSocketEventListener {

    private final MessageService messageService;

    private final SimpMessagingTemplate messagingTemplate;

    private final MessagesToResponse messagesToResponse;

    @Autowired
    public WebSocketEventListener(MessageService messageService,
                                  SimpMessagingTemplate messagingTemplate,
                                  MessagesToResponse messagesToResponse) {
        this.messageService = messageService;
        this.messagingTemplate = messagingTemplate;
        this.messagesToResponse = messagesToResponse;
    }

    @EventListener
    public void handleWebSocketConnectionListener(SessionSubscribeEvent event) {
        SimpMessageHeaderAccessor headers = SimpMessageHeaderAccessor.wrap(event.getMessage());
        if(isItSubscribeForChat(headers)) {
            String destination = createDestinationFromHeader(Objects.requireNonNull(headers.getDestination()));
            Principal user = headers.getUser();
            sendInformationAboutChatHistory(destination, Objects.requireNonNull(user));
        }
    }

    private boolean isItSubscribeForChat(SimpMessageHeaderAccessor headers) {
        return headers.getDestination() != null
                && headers.getUser() != null
                && headers.getDestination().startsWith("/user/topic/messages");
    }

    private void sendInformationAboutChatHistory(String destination, Principal user) {
        String userName = user.getName();
        String[] destinationArr = destination.split("/");
        String conversationId = destinationArr[destinationArr.length-1];
        try {
            GetMessagesResponse history = messagesToResponse.apply
                    (messageService.findAllByConversation(UUID.
                            fromString(conversationId)));
            messagingTemplate.convertAndSendToUser(userName, destination, history);
        } catch (IllegalArgumentException ignored) {

        }
    }

    private String createDestinationFromHeader(String destination) {
        return  "/" + Arrays.stream(destination.split("/"))
                .skip(2)
                .collect(Collectors.joining("/"));
    }
}