package pg.slema.user.entity;

import jakarta.persistence.*;
import lombok.*;
import pg.slema.conversation.entity.Conversation;

import java.util.List;
import java.util.UUID;

@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@Getter
@Setter
@Table(name = "users")
public class User {

    @Id
    private UUID id;

    private String nickname;

    @ManyToMany
    @JoinTable(
            name = "users_conversations",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "conversation_id"))
    private List<Conversation> conversations;
}
