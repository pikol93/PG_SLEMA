package pg.slema.conversation.service;

import pg.slema.conversation.entity.Conversation;

import java.util.List;
import java.util.UUID;

public interface ConversationService {
    List<Conversation> findAll();
    void create(Conversation conversation);
    List<Conversation> findAllByUser(UUID userId);
    void replace(Conversation conversation);
}
