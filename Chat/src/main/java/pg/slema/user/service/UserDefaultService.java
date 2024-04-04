package pg.slema.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pg.slema.user.entity.User;
import pg.slema.user.repository.UserRepository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

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
}
