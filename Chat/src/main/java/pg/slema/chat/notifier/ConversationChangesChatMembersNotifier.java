package pg.slema.chat.notifier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.notifier.ConversationChangesNotifier;
import pg.slema.user.dto.GetUsersResponse;
import pg.slema.user.entity.User;
import pg.slema.user.function.UsersToResponse;

import java.util.ArrayList;
import java.util.List;

@Component
public class ConversationChangesChatMembersNotifier implements ConversationChangesNotifier {

    private final SimpMessagingTemplate messagingTemplate;

    private final UsersToResponse usersToResponse;

    @Autowired
    public ConversationChangesChatMembersNotifier(SimpMessagingTemplate messagingTemplate,
                                                  UsersToResponse usersToResponse) {
        this.messagingTemplate = messagingTemplate;
        this.usersToResponse = usersToResponse;
    }

    @Override
    public void notifyListenersAboutChangesInParticipants(Conversation conversation) {
        List<User> users = getConversationUsers(conversation);
        sendMessageAboutChangesInUsers(usersToResponse.apply(users), conversation.getId().toString());
    }

    @Override
    public void notifyListenersAboutConversationCreation(Conversation conversation) {
        List<User> users = getConversationUsers(conversation);
        sendMessageAboutChangesInUsers(usersToResponse.apply(users), conversation.getId().toString());
    }

    private void sendMessageAboutChangesInUsers(GetUsersResponse usersResponse, String conversationId) {
        messagingTemplate.convertAndSend(String.format("/topic/conversations/%s/users", conversationId),
                usersResponse);
    }

    private List<User> getConversationUsers(Conversation conversation) {
        List<User> users = new ArrayList<>(List.of(conversation.getInitiator()));
        List<User> participants = conversation.getParticipants();
        if(participants != null) {
            users.addAll(participants);
        }
        return users;
    }
}
