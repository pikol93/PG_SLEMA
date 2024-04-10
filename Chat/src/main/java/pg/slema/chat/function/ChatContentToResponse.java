package pg.slema.chat.function;

import org.springframework.stereotype.Component;
import pg.slema.chat.dto.ChatContent;
import pg.slema.conversation.entity.Conversation;
import pg.slema.message.entity.Message;
import pg.slema.user.entity.User;
import pg.slema.util.function.TriFunction;

import java.util.List;

@Component
public class ChatContentToResponse implements TriFunction<Conversation, List<User>, List<Message>, ChatContent> {
    @Override
    public ChatContent apply(Conversation conversation, List<User> users, List<Message> messages) {
        return ChatContent.builder()
                .conversation(toConversation(conversation, users))
                .messages(messages.stream().map(this::toMessage).toList())
                .build();
    }

    private ChatContent.Conversation toConversation(Conversation conversation,
                                                    List<User> users) {
        return ChatContent.Conversation.builder()
                .members(users.stream().map(this::toUser).toList())
                .title(conversation.getTitle())
                .build();
    }

    private ChatContent.User toUser(User user) {
        return ChatContent.User.builder()
                .name(user.getName())
                .build();
    }

    private ChatContent.Message toMessage(Message message) {
        return ChatContent.Message.builder()
                .content(message.getContent())
                .sender(toUser(message.getSender()))
                .dateTime(message.getDateTime())
                .build();
    }
}
