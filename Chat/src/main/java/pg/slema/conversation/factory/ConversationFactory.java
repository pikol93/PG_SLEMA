package pg.slema.conversation.factory;

import pg.slema.chat.dto.ReceivedChatMessage;
import pg.slema.conversation.entity.Conversation;

public interface ConversationFactory {
    Conversation getConversationForReceivedMessage(ReceivedChatMessage message);
}
