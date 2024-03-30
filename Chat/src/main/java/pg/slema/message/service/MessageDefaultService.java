package pg.slema.message.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pg.slema.message.entity.Message;
import pg.slema.message.repository.MessageRepository;

import java.util.List;
import java.util.UUID;

@Service
public class MessageDefaultService implements MessageService {

    private final MessageRepository messageRepository;

    @Autowired
    public MessageDefaultService(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    @Override
    public List<Message> findAllByConversation(UUID conversationId) {
        return messageRepository.findMessagesByConversationId(conversationId);
    }

    @Override
    public void create(Message message) {
        messageRepository.save(message);
    }

}
