package pg.slema.chat.function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pg.slema.chat.dto.ReceivedChatMessage;
import pg.slema.conversation.provider.ConversationProvider;
import pg.slema.message.entity.Message;
import pg.slema.user.entity.User;

import java.util.UUID;
import java.util.function.BiFunction;

@Component
public class ReceiveMessageAsChatMessageFunction implements BiFunction<UUID, ReceivedChatMessage, Message> {

    private final ConversationProvider conversationProvider;

    @Autowired
    public ReceiveMessageAsChatMessageFunction(ConversationProvider conversationProvider) {
        this.conversationProvider = conversationProvider;
    }

    @Override
    public Message apply(UUID messageId, ReceivedChatMessage receivedChatMessage) {
        return Message.builder()
                .id(messageId)
                .content(receivedChatMessage.getContent())
                .dateTime(receivedChatMessage.getDateTime())
                .conversation(conversationProvider.getConversationForMember(receivedChatMessage.getConversationId(),
                        receivedChatMessage.getSenderId()))
                .sender(createSender(receivedChatMessage.getSenderId()))
                .build();
    }

    private User createSender(UUID senderId) {
        return User.builder()
                .id(senderId)
                .build();
    }
}
