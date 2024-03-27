package pg.slema.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import pg.slema.user.dto.GetUsersResponse;
import pg.slema.user.function.UsersToResponse;
import pg.slema.user.service.UserService;

@RestController
public class UserDefaultController implements UserController {

    private final UserService service;

    private final UsersToResponse usersToResponse;

    @Autowired
    public UserDefaultController(UserService service, UsersToResponse usersToResponse) {
        this.service = service;
        this.usersToResponse = usersToResponse;
    }

    @Override
    public GetUsersResponse getUsers() {
        return usersToResponse.apply(service.findAll());
    }
}
