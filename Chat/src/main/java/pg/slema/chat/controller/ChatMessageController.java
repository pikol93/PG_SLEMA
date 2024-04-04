package pg.slema.chat.controller;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import pg.slema.chat.dto.ReceivedChatMessage;

public interface ChatMessageController {

    @MessageMapping("/chat/{conversationId}")
    void handleChatMessage(@Payload ReceivedChatMessage receivedChatMessage, @DestinationVariable String conversationId);
}
