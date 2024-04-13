package pg.slema.chat.notifier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Component;
import pg.slema.chat.dto.ChatMember;
import pg.slema.chat.function.MemberToResponse;
import pg.slema.user.entity.User;

import java.util.UUID;

@Component
public class NewParticipantsNotifierImpl implements NewParticipantsNotifier {

    private final SimpMessagingTemplate messagingTemplate;

    private final MemberToResponse memberToResponse;

    @Autowired
    public NewParticipantsNotifierImpl(SimpMessagingTemplate messagingTemplate,
                                       MemberToResponse memberToResponse) {
        this.messagingTemplate = messagingTemplate;
        this.memberToResponse = memberToResponse;
    }
    @Override
    public void notifyAboutNewParticipant(UUID conversationId, User participant) {
        ChatMember response = memberToResponse.apply(participant);
        messagingTemplate.convertAndSend(String.format("/topic/conversations/%s/users", conversationId),
                response);
    }
}
