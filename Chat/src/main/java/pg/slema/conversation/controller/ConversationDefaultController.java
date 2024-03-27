package pg.slema.conversation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import pg.slema.conversation.dto.GetConversationsResponse;
import pg.slema.conversation.function.ConversationsToResponse;
import pg.slema.conversation.service.ConversationService;

@RestController
public class ConversationDefaultController implements ConversationController {

    private final ConversationService conversationService;

    private final ConversationsToResponse conversationsToResponse;

    @Autowired
    public ConversationDefaultController(ConversationService conversationService, ConversationsToResponse conversationsToResponse) {
        this.conversationService = conversationService;
        this.conversationsToResponse = conversationsToResponse;
    }

    @Override
    public GetConversationsResponse getConversations() {
        return conversationsToResponse.apply(conversationService.findAll());
    }
}
