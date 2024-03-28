package pg.slema.user.entity;

import jakarta.persistence.*;
import lombok.*;
import pg.slema.conversation.entity.Conversation;
import pg.slema.message.entity.Message;

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

    @ManyToMany(cascade = CascadeType.REMOVE)
    @JoinTable(
            name = "users_conversations",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "conversation_id"))
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private List<Conversation> conversations;

    @OneToMany(mappedBy = "sender", cascade = CascadeType.REMOVE)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private List<Message> messages;
}
