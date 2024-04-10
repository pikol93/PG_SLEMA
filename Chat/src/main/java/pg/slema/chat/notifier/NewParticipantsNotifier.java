package pg.slema.chat.notifier;

import pg.slema.user.entity.User;

import java.util.UUID;

public interface NewParticipantsNotifier {
    void notifyAboutNewParticipant(UUID conversationId, User participant);
}
