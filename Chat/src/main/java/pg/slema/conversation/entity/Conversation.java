package pg.slema.conversation.entity;

import jakarta.persistence.*;
import lombok.*;
import pg.slema.user.entity.User;

import java.util.List;
import java.util.UUID;


@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@Getter
@Setter
@Table(name = "conversations")
public class Conversation {

    @Id
    private UUID id;

    private String title;
}
