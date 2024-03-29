package pg.slema.user.function;

import org.springframework.stereotype.Component;
import pg.slema.user.dto.GetUserResponse;
import pg.slema.user.entity.User;

import java.util.function.Function;

@Component
public class UserToResponse implements Function<User, GetUserResponse> {

    @Override
    public GetUserResponse apply(User user) {
        return GetUserResponse.builder()
                .id(user.getId())
                .nickname(user.getNickname())
                .build();
    }
}
