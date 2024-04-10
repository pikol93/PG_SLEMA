package pg.slema.chat.dto;

import lombok.Builder;
import lombok.Data;

import java.util.UUID;

@Data
@Builder
public class ChatMember {

    private UUID id;

    private String name;
}
