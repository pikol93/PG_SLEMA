package pg.slema.message.entity;

import jakarta.persistence.*;
import lombok.*;
import pg.slema.conversation.entity.Conversation;
import pg.slema.user.entity.User;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@Getter
@Setter
@Table(name = "messages")
public class Message {

    @Id
    private UUID id;

    private String content;

    private LocalDateTime dateTime;

    @ManyToOne
    @JoinColumn(name = "conversation")
    private Conversation conversation;

    @ManyToOne
    @JoinColumn(name = "sender")
    private User sender;
}
