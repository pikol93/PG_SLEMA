package pg.slema.chat.function;

import org.springframework.stereotype.Component;
import pg.slema.chat.dto.ChatMember;
import pg.slema.user.entity.User;

import java.util.function.Function;

@Component
public class MemberToResponse implements Function<User, ChatMember> {
    @Override
    public ChatMember apply(User user) {
        return ChatMember.builder()
                .id(user.getId())
                .name(user.getName())
                .build();
    }
}
