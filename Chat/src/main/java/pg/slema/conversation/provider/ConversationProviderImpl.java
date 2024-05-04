package pg.slema.conversation.provider;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.service.ConversationService;
import pg.slema.user.entity.User;
import pg.slema.user.manager.ParticipantsManager;

import java.util.Optional;
import java.util.UUID;

@Component
public class ConversationProviderImpl implements ConversationProvider {

    private final ConversationService conversationService;

    private final ParticipantsManager participantsManager;

    @Autowired
    public ConversationProviderImpl(ConversationService conversationService,
                                    ParticipantsManager participantsManager) {
        this.conversationService = conversationService;
        this.participantsManager = participantsManager;
    }

    @Transactional
    @Override
    public Conversation getConversationForMember(UUID conversationId, User member) {
        Optional<Conversation> conversation = conversationService.find(conversationId);

        if(conversation.isEmpty()) {
            throw new RuntimeException("Conversation doesn't exist");
        }
        else {
            Conversation existingConversation = conversation.get();
            participantsManager.addParticipantIfNecessary(member, existingConversation);
            return existingConversation;
        }
    }
}
