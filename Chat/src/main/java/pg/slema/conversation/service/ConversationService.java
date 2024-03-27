package pg.slema.conversation.service;

import pg.slema.conversation.entity.Conversation;

import java.util.List;

public interface ConversationService {
    List<Conversation> findAll();
    void create(Conversation conversation);
}
