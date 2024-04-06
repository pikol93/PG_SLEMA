package pg.slema.user.service;

import pg.slema.user.entity.User;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

public interface UserService {
    List<User> findAll();
    List<User> findAllByConversation(UUID conversationId);
    List<User> findParticipantsByConversation(UUID conversationId);
    Optional<User> find(UUID userId);
    void create(User user);
    void replace(User user);
}
