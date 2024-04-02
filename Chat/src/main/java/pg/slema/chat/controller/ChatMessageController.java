package pg.slema.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;
import pg.slema.chat.dto.ChatMessage;

@Controller
public class ChatMessageController {

    @MessageMapping("/chat")
    @SendTo("/topic/messages")
    public ChatMessage get(@Payload ChatMessage chatMessage) {
        System.out.println(chatMessage.toString());
        return chatMessage;
    }
}
