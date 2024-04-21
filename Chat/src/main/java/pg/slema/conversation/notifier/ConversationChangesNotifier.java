package pg.slema.conversation.notifier;

import pg.slema.conversation.entity.Conversation;

public interface ConversationChangesNotifier {
    void notifyListenersAboutChangesInParticipants(Conversation conversation);
    void notifyListenersAboutConversationCreation(Conversation conversation);
}
