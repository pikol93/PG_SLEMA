package pg.slema.message.function;

import org.springframework.stereotype.Component;
import pg.slema.message.dto.GetMessageResponse;
import pg.slema.message.entity.Message;
import pg.slema.user.entity.User;

import java.util.function.Function;

@Component
public class MessageToResponse implements Function<Message, GetMessageResponse> {
    @Override
    public GetMessageResponse apply(Message message) {
        return GetMessageResponse.builder()
                .id(message.getId())
                .content(message.getContent())
                .sender(fromUser(message.getSender()))
                .dateTime(message.getDateTime())
                .build();
    }

    private GetMessageResponse.User fromUser(User user) {
        return GetMessageResponse.User.builder()
                .id(user.getId())
                .name(user.getName())
                .build();
    }

}
