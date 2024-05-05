package pg.slema.conversation.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pg.slema.conversation.entity.Conversation;

import java.util.List;
import java.util.UUID;

@Repository
public interface ConversationRepository extends JpaRepository<Conversation, UUID> {
    List<Conversation> findConversationsByInitiatorId(UUID userId);
    List<Conversation> findConversationsByInitiatorIdNot(UUID userId);
    List<Conversation> findConversationsByParticipantsId(UUID userId);
}
