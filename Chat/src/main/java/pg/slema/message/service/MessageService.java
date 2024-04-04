package pg.slema.message.service;

import pg.slema.message.entity.Message;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface MessageService {
    Optional<Message> find(UUID messageId);
    List<Message> findAllByConversation(UUID conversationId);
    void create(Message message);
}
