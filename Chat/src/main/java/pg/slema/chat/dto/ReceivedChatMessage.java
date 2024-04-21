package pg.slema.chat.dto;

import lombok.Data;

import java.time.ZonedDateTime;
import java.util.UUID;

@Data
public class ReceivedChatMessage {

    private String content;

    private ZonedDateTime dateTime;

    private UUID senderId;

    private UUID conversationId;
}
