package pg.slema.conversation.dto;

import lombok.Builder;
import lombok.Data;
import lombok.Singular;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Data
@Builder
public class GetConversationsResponse {

    @Data
    @Builder
    public static class User {

        private String name;
    }

    @Data
    @Builder
    public static class Message {

        private String content;

        private LocalDateTime dateTime;

        private User sender;
    }

    @Data
    @Builder
    public static class Conversation {

        private final UUID id;

        private final String title;

        private final Message lastMessage;
    }

    @Singular
    private List<Conversation> conversations;
}
