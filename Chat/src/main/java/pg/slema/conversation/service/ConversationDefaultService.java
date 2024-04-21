package pg.slema.conversation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.repository.ConversationRepository;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class ConversationDefaultService implements ConversationService {

    private final ConversationRepository conversationRepository;

    private final Comparator<Conversation> conversationComparator;

    @Autowired
    public ConversationDefaultService(ConversationRepository conversationRepository,
                                      Comparator<Conversation> conversationComparator) {
        this.conversationRepository = conversationRepository;
        this.conversationComparator = conversationComparator;
    }

    @Override
    public Optional<Conversation> find(UUID id) {
        return conversationRepository.findById(id);
    }

    @Override
    public List<Conversation> findAll() {
        List<Conversation> conversations = conversationRepository.findAll();
        conversations.sort(conversationComparator);
        return conversations;
    }

    @Override
    public List<Conversation> findAllByInitiator(UUID userId) {
        List<Conversation> conversations = conversationRepository.findConversationsByInitiatorId(userId);
        conversations.sort(conversationComparator);
        return conversations;
    }

    @Override
    public List<Conversation> findAllByParticipant(UUID userId) {
        List<Conversation> conversations = conversationRepository.findConversationsByParticipantsId(userId);
        conversations.sort(conversationComparator);
        return conversations;
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
