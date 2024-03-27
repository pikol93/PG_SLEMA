package pg.slema.conversation.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import pg.slema.conversation.dto.GetConversationsResponse;

public interface ConversationController {

    @GetMapping("/api/conversations")
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    GetConversationsResponse getConversations();
}
