package pg.slema.conversation.dto;

import lombok.Data;
import pg.slema.chat.dto.ReceivedChatMessage;

import java.util.UUID;

@Data
public class PutConversationRequest {

    private String title;

    private UUID initiatorId;

    private ReceivedChatMessage message;
}
