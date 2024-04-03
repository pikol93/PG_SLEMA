package pg.slema.conversation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.repository.ConversationRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class ConversationDefaultService implements ConversationService {

    private final ConversationRepository conversationRepository;

    @Autowired
    public ConversationDefaultService(ConversationRepository conversationRepository) {
        this.conversationRepository = conversationRepository;
    }

    @Override
    public Optional<Conversation> find(UUID id) {
        return conversationRepository.findById(id);
    }

    @Override
    public List<Conversation> findAll() {
        return conversationRepository.findAll();
    }

    @Override
    public List<Conversation> findAllByInitiator(UUID userId) {
        return conversationRepository.findConversationsByInitiatorId(userId);
    }

    @Override
    public List<Conversation> findAllByParticipant(UUID userId) {
        return conversationRepository.findConversationsByParticipantsId(userId);
    }

    @Override
    public void create(Conversation conversation) {
        conversationRepository.save(conversation);
    }

    @Override
    public void replace(Conversation conversation) {
        conversationRepository.save(conversation);
    }
}
