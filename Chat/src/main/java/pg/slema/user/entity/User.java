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

    @ManyToMany(mappedBy = "participants")
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private List<Conversation> participatedConversations;

    @OneToMany(mappedBy = "initiator", cascade = CascadeType.REMOVE)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private List<Conversation> initiatedConversations;

    @OneToMany(mappedBy = "sender", cascade = CascadeType.REMOVE)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private List<Message> messages;
}
