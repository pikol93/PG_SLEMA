package pg.slema.message.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import pg.slema.message.dto.GetMessagesResponse;
import pg.slema.message.function.MessagesToResponse;
import pg.slema.message.service.MessageService;

import java.util.UUID;

@RestController
public class MessageDefaultController implements MessageController {

    private final MessageService messageService;

    private final MessagesToResponse messagesToResponse;

    @Autowired
    public MessageDefaultController(MessageService messageService, MessagesToResponse messagesToResponse) {
        this.messageService = messageService;
        this.messagesToResponse = messagesToResponse;
    }

    @Override
    public GetMessagesResponse getConversationMessages(UUID conversationId) {
        return messagesToResponse.apply(messageService.findAllByConversation(conversationId));
    }

}
