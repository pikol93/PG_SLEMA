package pg.slema.message.dto;

import lombok.Builder;
import lombok.Data;
import lombok.Singular;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Data
@Builder
public class GetMessagesResponse {

    @Data
    @Builder
    public static class User {

        private UUID id;

        private String name;
    }

    @Data
    @Builder
    public static class Message {

        private UUID id;

        private String content;

        private User sender;

        private LocalDateTime dateTime;
    }

    @Singular
    private List<Message> messages;
}
