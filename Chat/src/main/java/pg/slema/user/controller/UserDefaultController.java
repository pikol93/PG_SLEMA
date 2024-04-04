package pg.slema.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import pg.slema.user.dto.GetUserResponse;
import pg.slema.user.dto.GetUsersResponse;
import pg.slema.user.function.UserToResponse;
import pg.slema.user.function.UsersToResponse;
import pg.slema.user.service.UserService;

import java.util.UUID;

@RestController
public class UserDefaultController implements UserController {

    private final UserService service;

    private final UsersToResponse usersToResponse;

    private final UserToResponse userToResponse;

    @Autowired
    public UserDefaultController(UserService service,
                                 UsersToResponse usersToResponse,
                                 UserToResponse userToResponse) {
        this.service = service;
        this.usersToResponse = usersToResponse;
        this.userToResponse = userToResponse;
    }

    @Override
    public GetUsersResponse getUsers() {
        return usersToResponse.apply(service.findAll());
    }

    @Override
    public GetUserResponse getUser(UUID userId) {
        return service.find(userId).map(userToResponse).orElseThrow();
    }
}
