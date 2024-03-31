package pg.slema.conversation.function;

import org.springframework.stereotype.Component;
import pg.slema.conversation.dto.GetConversationsResponse;
import pg.slema.conversation.entity.Conversation;
import pg.slema.message.entity.Message;
import pg.slema.user.entity.User;

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
                .lastMessage(fromMessage(conversation.getLastMessage()))
                .build();
    }

    private GetConversationsResponse.Message fromMessage(Message message) {
        return GetConversationsResponse.Message.builder()
                .content(message.getContent())
                .dateTime(message.getDateTime())
                .sender(fromUser(message.getSender()))
                .build();
    }

    private GetConversationsResponse.User fromUser(User user) {
        return GetConversationsResponse.User.builder()
                .name(user.getNickname())
                .build();
    }
}
