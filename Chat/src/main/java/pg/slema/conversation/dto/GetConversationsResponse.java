package pg.slema.conversation.dto;

import lombok.Builder;
import lombok.Data;
import lombok.Singular;

import java.util.List;
import java.util.UUID;

@Data
@Builder
public class GetConversationsResponse {

    @Data
    @Builder
    public static class Conversation {

        private final UUID id;

        private final String title;
    }

    @Singular
    private List<Conversation> conversations;
}
