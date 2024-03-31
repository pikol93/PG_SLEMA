package pg.slema.user.dto;

import lombok.Builder;
import lombok.Data;
import lombok.Singular;

import java.util.List;
import java.util.UUID;

@Data
@Builder
public class GetUsersResponse {

    @Data
    @Builder
    public static class User {

        private UUID id;

        private String name;
    }

    @Singular
    private List<User> users;
}
