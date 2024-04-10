package pg.slema.chat.dto;

import lombok.Builder;
import lombok.Data;
import lombok.Singular;

import java.time.ZonedDateTime;
import java.util.List;
import java.util.UUID;

@Data
@Builder
public class ChatContent {

    @Data
    @Builder
    public static class Message {

        private String content;

        private ChatMember sender;

        private ZonedDateTime dateTime;
    }

    @Data
    @Builder
    public static class Conversation {

        private String title;

        @Singular
        private List<ChatMember> members;
    }

    @Singular
    private List<Message> messages;

    private Conversation conversation;
}
