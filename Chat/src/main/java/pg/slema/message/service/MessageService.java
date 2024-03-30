package pg.slema.message.service;

import pg.slema.message.entity.Message;

import java.util.List;
import java.util.UUID;

public interface MessageService {
    List<Message> findAllByConversation(UUID conversationId);
    void create(Message message);

}
