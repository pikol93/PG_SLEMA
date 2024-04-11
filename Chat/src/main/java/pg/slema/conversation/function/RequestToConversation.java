package pg.slema.conversation.function;

import org.springframework.stereotype.Component;
import pg.slema.conversation.dto.PutConversationRequest;
import pg.slema.conversation.entity.Conversation;
import pg.slema.user.entity.User;

import java.util.UUID;
import java.util.function.BiFunction;

@Component
public class RequestToConversation implements BiFunction<UUID, PutConversationRequest, Conversation> {

    @Override
    public Conversation apply(UUID uuid, PutConversationRequest request) {
        return Conversation.builder()
                .id(uuid)
                .title(request.getTitle())
                .initiator(User.builder()
                        .id(request.getInitiatorId())
                        .build())
                .build();
    }
}
