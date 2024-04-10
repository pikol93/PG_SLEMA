package pg.slema.user.manager;

import org.springframework.stereotype.Component;
import pg.slema.chat.notifier.NewParticipantsNotifier;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.service.ConversationService;
import pg.slema.user.entity.User;
import pg.slema.user.service.UserService;

import java.util.List;

@Component
public class ParticipantsManagerImpl implements ParticipantsManager {

    private final UserService userService;

    private final ConversationService conversationService;

    private final NewParticipantsNotifier newParticipantsNotifier;

    public ParticipantsManagerImpl(UserService userService,
                                   ConversationService conversationService,
                                   NewParticipantsNotifier newParticipantsNotifier) {
        this.userService = userService;
        this.conversationService = conversationService;
        this.newParticipantsNotifier = newParticipantsNotifier;
    }

    @Override
    public void addParticipantIfNecessary(User user, Conversation conversation) {
        List<User> participants = userService.findParticipantsByConversation(conversation.getId());
        User initiator = conversation.getInitiator();
        if(!user.equals(initiator) && !participants.contains(user)) {
            participants.add(user);
            conversation.setParticipants(participants);
            conversationService.replace(conversation);
            newParticipantsNotifier.notifyAboutNewParticipant(conversation.getId(), user);
        }
    }
}
