package pg.slema.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pg.slema.conversation.entity.Conversation;
import pg.slema.user.entity.User;
import pg.slema.user.repository.UserRepository;

import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class UserDefaultService implements UserService {

    private final UserRepository repository;

    @Autowired
    public UserDefaultService(UserRepository repository) {
        this.repository = repository;
    }

    @Override
    public List<User> findAll() {
        return repository.findAll();
    }

    @Override
    public List<User> findAllByConversation(UUID conversationId) {
        List<User> users = repository.findAll();
        return users.stream()
                .filter(user -> getConversationsIds(getUserConversations(user))
                        .contains(conversationId))
                .toList();
    }

    @Override
    public List<User> findParticipantsByConversation(UUID conversationId) {
        List<User> users = repository.findAll();
        return users.stream()
                .filter(user -> getConversationsIds(user.getParticipatedConversations()).contains(conversationId))
                .collect(Collectors.toList());
    }

    public Optional<User> find(UUID userID) {
        return repository.findById(userID);
    }

    @Override
    public void create(User user) {
        repository.save(user);
    }

    @Override
    public void replace(User user) {
        repository.save(user);
    }

    private List<UUID> getConversationsIds(List<Conversation> conversations) {
        return conversations.stream()
                .map(Conversation::getId)
                .collect(Collectors.toList());
    }

    private List<Conversation> getUserConversations(User user) {
        List<Conversation> initiatedConversations = user.getInitiatedConversations();
        List<Conversation> participatedConversations = user.getParticipatedConversations();
        List<Conversation> conversations = new LinkedList<>(initiatedConversations);
        conversations.addAll(participatedConversations);
        return conversations;
    }
}
