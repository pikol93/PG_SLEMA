package pg.slema.message.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.repository.ConversationRepository;
import pg.slema.message.entity.Message;
import pg.slema.message.repository.MessageRepository;

import java.util.*;

@Service
public class MessageDefaultService implements MessageService {

    private final MessageRepository messageRepository;

    private final ConversationRepository conversationRepository;

    private final Comparator<Message> messageComparator;

    @Autowired
    public MessageDefaultService(MessageRepository messageRepository,
                                 ConversationRepository conversationRepository,
                                 Comparator<Message> messageComparator) {
        this.messageRepository = messageRepository;
        this.conversationRepository = conversationRepository;
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
        Conversation conversation = message.getConversation();
        Message lastMessage = conversation.getLastMessage();
        if(lastMessage == null || isFirstFromFuture(message, lastMessage)) {
            conversation.setLastMessage(message);
            conversationRepository.save(conversation);
        }
    }

    private boolean isFirstFromFuture(Message first, Message second) {
        return messageComparator.compare(first, second) >= 0;
    }

}
