package pg.slema.conversation.provider;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.service.ConversationService;
import pg.slema.user.entity.User;
import pg.slema.user.manager.ParticipantsManager;
import pg.slema.user.service.UserService;

import java.util.Optional;
import java.util.UUID;

@Component
public class ConversationProviderImpl implements ConversationProvider {

    private final ConversationService conversationService;

    private final UserService userService;

    private final ParticipantsManager participantsManager;

    @Autowired
    public ConversationProviderImpl(ConversationService conversationService,
                                    UserService userService, ParticipantsManager participantsManager) {
        this.conversationService = conversationService;
        this.userService = userService;
        this.participantsManager = participantsManager;
    }

    @Transactional
    @Override
    public Conversation getConversationForMember(UUID conversationId, UUID userId) {
        Optional<Conversation> conversation = conversationService.find(conversationId);
        Optional<User> member = userService.find(userId);

        if(member.isEmpty()) {
            throw new RuntimeException("User doesn't exist");
        }

        if(conversation.isEmpty()) {
            throw new RuntimeException("Conversation doesn't exist"); //TODO make this exception checked
        }
        else {
            Conversation existingConversation = conversation.get();
            participantsManager.addParticipantIfNecessary(member.get(), existingConversation);
            return existingConversation;
        }
    }
}
