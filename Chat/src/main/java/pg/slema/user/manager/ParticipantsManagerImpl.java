package pg.slema.user.manager;

import org.springframework.stereotype.Component;
import pg.slema.chat.notifier.NewParticipantsNotifier;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.service.ConversationService;
import pg.slema.user.entity.User;
import pg.slema.user.service.UserService;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

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
        if(!user.getId().equals(initiator.getId()) && participants
                .stream().map(User::getId)
                .noneMatch(id -> id.equals(user.getId()))) {
            participants.add(user);
            conversation.setParticipants(participants);
            conversationService.replace(conversation);
            notifyAboutNewParticipant(user.getId(), conversation.getId());
        }
    }

    private void notifyAboutNewParticipant(UUID userId, UUID conversationId) {

        Optional<User> user = userService.find(userId);

        if(user.isEmpty()) {
            throw new RuntimeException("User doesn't exist");
        }

        newParticipantsNotifier.notifyAboutNewParticipant(conversationId, user.get());
    }
}
