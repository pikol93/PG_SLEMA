package pg.slema.user.function;

import org.springframework.stereotype.Component;
import pg.slema.user.dto.GetUsersResponse;
import pg.slema.user.entity.User;

import java.util.List;
import java.util.function.Function;

@Component
public class UsersToResponse implements Function<List<User>, GetUsersResponse> {

    @Override
    public GetUsersResponse apply(List<User> users) {
        return GetUsersResponse.builder()
                .users(users.stream().map(this::toUser).toList())
                .build();
    }

    private GetUsersResponse.User toUser(User user) {
        return GetUsersResponse.User.builder()
                .id(user.getId())
                .name(user.getName())
                .isBanned(user.isBanned())
                .isEmailConfirmed(user.isEmailConfirmed())
                .build();
    }
}
