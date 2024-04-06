package pg.slema.chat.function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pg.slema.chat.dto.ReceivedChatMessage;
import pg.slema.chat.mapper.ReceivedChatMessageConversationMapper;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.service.ConversationService;
import pg.slema.message.entity.Message;
import pg.slema.user.entity.User;

import java.util.Optional;
import java.util.UUID;
import java.util.function.BiFunction;

@Component
public class ReceiveMessageAsChatMessageFunction implements BiFunction<UUID, ReceivedChatMessage, Message> {

    private final ConversationService conversationService;

    private final ReceivedChatMessageConversationMapper conversationMapper;

    @Autowired
    public ReceiveMessageAsChatMessageFunction(ConversationService conversationService,
                                               ReceivedChatMessageConversationMapper conversationMapper) {
        this.conversationService = conversationService;
        this.conversationMapper = conversationMapper;
    }

    @Override
    public Message apply(UUID messageId, ReceivedChatMessage receivedChatMessage) {
        return Message.builder()
                .id(messageId)
                .content(receivedChatMessage.getContent())
                .dateTime(receivedChatMessage.getDateTime())
                .conversation(createConversation(receivedChatMessage))
                .sender(createSender(receivedChatMessage.getSenderId()))
                .build();
    }

    private Conversation createConversation(ReceivedChatMessage message) {
        ReceivedChatMessage.Conversation messageConversation = message.getConversation();
        Optional<Conversation> conversation = conversationService.find(messageConversation.getId());
        if(conversation.isEmpty()) {
            Conversation createdConversation = conversationMapper.apply(message.getSenderId(), messageConversation);
            conversationService.create(createdConversation);
            return createdConversation;
        }
        else {
            return conversation.get();
        }
    }

    private User createSender(UUID senderId) {
        return User.builder()
                .id(senderId)
                .build();
    }
}
