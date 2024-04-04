package pg.slema.message.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import pg.slema.message.dto.GetMessagesResponse;

import java.util.UUID;

public interface MessageController {

    @GetMapping("/api/conversations/{conversationId}/messages")
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    GetMessagesResponse getConversationMessages(@PathVariable("conversationId") UUID conversationId);

}
