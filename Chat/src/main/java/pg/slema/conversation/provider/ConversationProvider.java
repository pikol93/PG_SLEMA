package pg.slema.conversation.provider;

import pg.slema.conversation.entity.Conversation;
import pg.slema.user.entity.User;

import java.util.UUID;

public interface ConversationProvider {
    Conversation getConversationForMember(UUID conversationId, User member);
}
