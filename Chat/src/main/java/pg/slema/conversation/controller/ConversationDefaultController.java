package pg.slema.conversation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;
import pg.slema.conversation.dto.GetConversationsResponse;
import pg.slema.conversation.function.ConversationsToResponse;
import pg.slema.conversation.service.ConversationService;

import java.util.Objects;
import java.util.UUID;

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

    @Override
    public GetConversationsResponse getUserConversations(UUID userId, String role) {
        if(role.equals("participant")) {
            return conversationsToResponse.apply(conversationService.findAllByParticipant(userId));
        } else if(role.equals("initiator")) {
            return conversationsToResponse.apply(conversationService.findAllByInitiator(userId));
        } else {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
        }
    }
}
