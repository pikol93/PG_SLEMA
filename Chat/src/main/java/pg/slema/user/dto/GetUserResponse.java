package pg.slema.user.dto;

import lombok.Builder;
import lombok.Data;

import java.util.UUID;

@Data
@Builder
public class GetUserResponse {

    private UUID id;

    private String name;

    private String email;

    private String sex;

    private boolean isBanned;

    private boolean isEmailConfirmed;
}
