package pg.slema.chat.dto;

import lombok.Data;

import java.time.ZonedDateTime;
import java.util.UUID;

@Data
public class ReceivedChatMessage {

    @Data
    public static class Conversation {

        private UUID id;

        private String title;
    }

    private String content;

    private ZonedDateTime dateTime;

    private UUID senderId;

    private Conversation conversation;
}
