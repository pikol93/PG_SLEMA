package pg.slema.user.service;

import pg.slema.user.entity.User;

import java.util.List;

public interface UserService {
    List<User> findAll();
    void create(User user);
    void replace(User user);
}
