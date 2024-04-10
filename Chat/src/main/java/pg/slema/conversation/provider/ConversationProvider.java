package pg.slema.conversation.provider;

import jakarta.transaction.Transactional;
import pg.slema.conversation.entity.Conversation;
import pg.slema.user.entity.User;

import java.util.UUID;

public interface ConversationProvider {
    Conversation getConversationForMember(UUID conversationId, User member);
}
