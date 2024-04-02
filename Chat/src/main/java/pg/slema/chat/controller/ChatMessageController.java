package pg.slema.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import pg.slema.chat.dto.ChatMessage;

import java.util.UUID;

@Controller
public class ChatMessageController {

    private final SimpMessagingTemplate messagingTemplate;

    @Autowired
    public ChatMessageController(SimpMessagingTemplate messagingTemplate) {
        this.messagingTemplate = messagingTemplate;
    }

    @MessageMapping("/chat/{conversationId}")
    public void handleChatMessage(@Payload ChatMessage chatMessage, @DestinationVariable String conversationId) {
        messagingTemplate.convertAndSend("/topic/messages/" + conversationId, chatMessage);
    }
}
