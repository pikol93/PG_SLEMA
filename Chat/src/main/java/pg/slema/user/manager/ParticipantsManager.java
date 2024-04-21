package pg.slema.user.manager;

import pg.slema.conversation.entity.Conversation;
import pg.slema.user.entity.User;

public interface ParticipantsManager {
    void addParticipantIfNecessary(User user, Conversation conversation);
}
