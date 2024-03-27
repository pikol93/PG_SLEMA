package pg.slema.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pg.slema.user.entity.User;
import pg.slema.user.repository.UserRepository;

import java.util.List;

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
    public void create(User user) {
        repository.save(user);
    }
}
