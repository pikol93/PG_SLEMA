package pg.slema.message.dto;

import lombok.Builder;
import lombok.Data;
import lombok.Singular;

import java.time.LocalDateTime;
import java.time.ZonedDateTime;
import java.util.List;
import java.util.UUID;

@Data
@Builder
public class GetMessageResponse {

    @Data
    @Builder
    public static class User {

        private UUID id;

        private String name;
    }

    private UUID id;

    private String content;

    private User sender;

    private ZonedDateTime dateTime;
}
