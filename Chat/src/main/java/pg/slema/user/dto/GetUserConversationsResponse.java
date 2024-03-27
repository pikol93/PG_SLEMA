package pg.slema.user.dto;

import lombok.Builder;
import lombok.Data;
import lombok.Singular;

import java.util.List;
import java.util.UUID;

@Data
@Builder
public class GetUserConversationsResponse {

    @Data
    @Builder
    public static class User {

        private UUID id;

        private String nickname;
    }

    @Data
    @Builder
    public static class Conversation {

        private UUID id;

        private String title;
    }

    @Singular
    private List<Conversation> conversations;

    private User user;
}
