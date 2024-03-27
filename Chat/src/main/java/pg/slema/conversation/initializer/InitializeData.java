package pg.slema.conversation.initializer;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.service.ConversationService;

import java.util.UUID;

@Component
public class InitializeData implements InitializingBean {

    private final ConversationService conversationService;

    @Autowired
    public InitializeData(ConversationService conversationService) {
        this.conversationService = conversationService;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        if(conversationService.findAll().isEmpty()) {
            Conversation first = Conversation.builder()
                    .id(UUID.randomUUID())
                    .title("First")
                    .build();

            Conversation second = Conversation.builder()
                    .id(UUID.randomUUID())
                    .title("Second")
                    .build();

            conversationService.create(first);
            conversationService.create(second);
        }
    }
}
