package pg.slema.conversation.function;

import org.springframework.stereotype.Component;
import pg.slema.conversation.dto.GetConversationsResponse;
import pg.slema.conversation.entity.Conversation;

import java.util.List;
import java.util.function.Function;

@Component
public class ConversationsToResponse implements Function<List<Conversation>, GetConversationsResponse> {

    @Override
    public GetConversationsResponse apply(List<Conversation> conversationList) {
        return GetConversationsResponse.builder()
                .conversations(conversationList.stream()
                        .map(this::fromConversation).toList())
                .build();
    }

    private GetConversationsResponse.Conversation fromConversation(Conversation conversation) {
        return GetConversationsResponse.Conversation.builder()
                .id(conversation.getId())
                .title(conversation.getTitle())
                .build();
    }
}
