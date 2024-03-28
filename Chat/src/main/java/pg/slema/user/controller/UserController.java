package pg.slema.user.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import pg.slema.user.dto.GetUsersResponse;

public interface UserController {
    @RequestMapping("/api/users")
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    GetUsersResponse getUsers();
}
