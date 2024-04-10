package pg.slema.message.function;

import org.springframework.stereotype.Component;
import pg.slema.message.dto.GetMessagesResponse;
import pg.slema.message.entity.Message;
import pg.slema.user.entity.User;

import java.util.List;
import java.util.function.Function;

@Component
public class MessagesToResponse implements Function<List<Message>, GetMessagesResponse> {

    @Override
    public GetMessagesResponse apply(List<Message> messages) {
        return GetMessagesResponse.builder()
                .messages(messages.stream().map(this::fromMessage).toList())
                .build();
    }

    private GetMessagesResponse.Message fromMessage(Message message) {
        return GetMessagesResponse.Message.builder()
                .id(message.getId())
                .content(message.getContent())
                .sender(fromUser(message.getSender()))
                .dateTime(message.getDateTime())
                .build();
    }

    private GetMessagesResponse.User fromUser(User user) {
        return GetMessagesResponse.User.builder()
                .name(user.getName())
                .build();
    }

}
