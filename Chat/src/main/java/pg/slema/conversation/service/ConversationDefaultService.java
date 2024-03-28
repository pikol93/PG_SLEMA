package pg.slema.conversation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.repository.ConversationRepository;

import java.util.List;
import java.util.UUID;

@Service
public class ConversationDefaultService implements ConversationService {

    private final ConversationRepository conversationRepository;

    @Autowired
    public ConversationDefaultService(ConversationRepository conversationRepository) {
        this.conversationRepository = conversationRepository;
    }

    @Override
    public List<Conversation> findAll() {
        return conversationRepository.findAll();
    }

    @Override
    public void create(Conversation conversation) {
        conversationRepository.save(conversation);
    }

    @Override
    public List<Conversation> findAllByUser(UUID userId) {
        return conversationRepository.findConversationsByUsersId(userId);
    }

    @Override
    public void replace(Conversation conversation) {
        conversationRepository.save(conversation);
    }
}
