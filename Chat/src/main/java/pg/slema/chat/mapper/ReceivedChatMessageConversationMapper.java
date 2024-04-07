package pg.slema.chat.mapper;

import org.springframework.stereotype.Component;
import pg.slema.chat.dto.ReceivedChatMessage;
import pg.slema.conversation.entity.Conversation;
import pg.slema.user.entity.User;

import java.util.ArrayList;
import java.util.UUID;
import java.util.function.BiFunction;

@Component
public class ReceivedChatMessageConversationMapper implements BiFunction<UUID,
        ReceivedChatMessage.Conversation, Conversation> {
    @Override
    public Conversation apply(UUID initiatorId, ReceivedChatMessage.Conversation conversation) {
        return Conversation.builder()
                .id(conversation.getId())
                .title(conversation.getTitle())
                .initiator(User.builder()
                        .id(initiatorId)
                        .build())
                .build();
    }
}
