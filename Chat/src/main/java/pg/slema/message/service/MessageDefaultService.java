package pg.slema.message.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pg.slema.message.entity.Message;
import pg.slema.message.repository.MessageRepository;

import java.util.*;

@Service
public class MessageDefaultService implements MessageService {

    private final MessageRepository messageRepository;

    private final Comparator<Message> messageComparator;

    @Autowired
    public MessageDefaultService(MessageRepository messageRepository,
                                 Comparator<Message> messageComparator) {
        this.messageRepository = messageRepository;
        this.messageComparator = messageComparator;
    }

    @Override
    public List<Message> findAllByConversation(UUID conversationId) {
        List<Message> messages = messageRepository.findMessagesByConversationId(conversationId);
        messages.sort(messageComparator);
        return messages;
    }

    @Override
    public void create(Message message) {
        messageRepository.save(message);
    }

}
