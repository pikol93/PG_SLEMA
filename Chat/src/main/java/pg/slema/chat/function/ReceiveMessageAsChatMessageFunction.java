package pg.slema.chat.function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pg.slema.chat.dto.ReceivedChatMessage;
import pg.slema.conversation.factory.ConversationFactory;
import pg.slema.message.entity.Message;
import pg.slema.user.entity.User;

import java.util.UUID;
import java.util.function.BiFunction;

@Component
public class ReceiveMessageAsChatMessageFunction implements BiFunction<UUID, ReceivedChatMessage, Message> {

    private final ConversationFactory conversationFactory;

    @Autowired
    public ReceiveMessageAsChatMessageFunction(ConversationFactory conversationFactory) {
        this.conversationFactory = conversationFactory;
    }

    @Override
    public Message apply(UUID messageId, ReceivedChatMessage receivedChatMessage) {
        return Message.builder()
                .id(messageId)
                .content(receivedChatMessage.getContent())
                .dateTime(receivedChatMessage.getDateTime())
                .conversation(conversationFactory.getConversationForReceivedMessage(receivedChatMessage))
                .sender(createSender(receivedChatMessage.getSenderId()))
                .build();
    }

    private User createSender(UUID senderId) {
        return User.builder()
                .id(senderId)
                .build();
    }
}
