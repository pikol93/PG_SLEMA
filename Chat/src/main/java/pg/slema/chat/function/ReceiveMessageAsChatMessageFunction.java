package pg.slema.chat.function;

import org.springframework.stereotype.Component;
import pg.slema.chat.dto.ReceivedChatMessage;
import pg.slema.conversation.entity.Conversation;
import pg.slema.message.entity.Message;
import pg.slema.user.entity.User;

import java.util.UUID;
import java.util.function.BiFunction;

@Component
public class ReceiveMessageAsChatMessageFunction implements BiFunction<UUID, ReceivedChatMessage, Message> {

    @Override
    public Message apply(UUID messageId, ReceivedChatMessage receivedChatMessage) {
        return Message.builder()
                .id(messageId)
                .content(receivedChatMessage.getContent())
                .dateTime(receivedChatMessage.getDateTime())
                .conversation(createConversation(receivedChatMessage.getConversationId()))
                .sender(createSender(receivedChatMessage.getSenderId()))
                .build();
    }

    private Conversation createConversation(UUID conversationId) {
        return Conversation.builder()
                .id(conversationId)
                .build();
    }

    private User createSender(UUID senderId) {
        return User.builder()
                .id(senderId)
                .build();
    }
}
