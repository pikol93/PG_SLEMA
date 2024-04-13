package pg.slema.conversation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;
import pg.slema.chat.function.ReceiveMessageAsChatMessageFunction;
import pg.slema.conversation.dto.GetConversationsResponse;
import pg.slema.conversation.dto.PutConversationRequest;
import pg.slema.conversation.function.ConversationsToResponse;
import pg.slema.conversation.function.RequestToConversation;
import pg.slema.conversation.service.ConversationService;
import pg.slema.message.service.MessageService;

import java.util.UUID;

@CrossOrigin(origins = "*")
@RestController
public class ConversationDefaultController implements ConversationController {

    private final ConversationService conversationService;

    private final MessageService messageService;

    private final ConversationsToResponse conversationsToResponse;

    private final RequestToConversation requestToConversation;

    private final ReceiveMessageAsChatMessageFunction receiveMessageAsChatMessageFunction;

    @Autowired
    public ConversationDefaultController(ConversationService conversationService,
                                         MessageService messageService,
                                         ConversationsToResponse conversationsToResponse,
                                         RequestToConversation requestToConversation,
                                         ReceiveMessageAsChatMessageFunction receiveMessageAsChatMessageFunction) {
        this.conversationService = conversationService;
        this.messageService = messageService;
        this.conversationsToResponse = conversationsToResponse;
        this.requestToConversation = requestToConversation;
        this.receiveMessageAsChatMessageFunction = receiveMessageAsChatMessageFunction;
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

    @Override
    public void putConversation(UUID conversationId, PutConversationRequest request) {
        conversationService.create(requestToConversation.apply(conversationId, request));
        messageService.create(receiveMessageAsChatMessageFunction.apply(UUID.randomUUID(), request.getMessage()));
    }
}
