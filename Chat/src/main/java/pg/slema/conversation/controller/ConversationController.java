package pg.slema.conversation.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import pg.slema.conversation.dto.GetConversationsResponse;

import java.util.UUID;

public interface ConversationController {
    @GetMapping("/api/conversations")
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    GetConversationsResponse getConversations();

    @GetMapping("/api/users/{userId}/conversations")
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    GetConversationsResponse getUserConversations(@PathVariable("userId") UUID userId,
                                                  @RequestParam String role);
}
