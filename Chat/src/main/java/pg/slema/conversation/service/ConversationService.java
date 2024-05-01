package pg.slema.conversation.service;

import pg.slema.conversation.entity.Conversation;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface ConversationService {
    Optional<Conversation> find(UUID id);
    List<Conversation> findAll();
    List<Conversation> findAllByInitiator(UUID userId);
    List<Conversation> findAllByParticipant(UUID userId);
    List<Conversation> findAllByNotAttended(UUID userId);
    List<Conversation> findAllByNotInitiated(UUID userId);
    void create(Conversation conversation);
    void replace(Conversation conversation);
}
