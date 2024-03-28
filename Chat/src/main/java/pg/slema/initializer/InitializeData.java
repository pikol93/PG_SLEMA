package pg.slema.initializer;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.service.ConversationService;
import pg.slema.user.entity.User;
import pg.slema.user.service.UserService;

import java.util.List;
import java.util.UUID;

@Component
public class InitializeData implements InitializingBean {

    private final UserService userService;

    private final ConversationService conversationService;

    @Autowired
    public InitializeData(UserService userService, ConversationService conversationService) {
        this.userService = userService;
        this.conversationService = conversationService;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        initializeUsers();
        initializeConversations();
        bindUsersAndConversations();
    }

    private void initializeConversations() {
        if(conversationService.findAll().isEmpty()) {
            Conversation first = Conversation.builder()
                    .id(UUID.fromString("fb7a453b-72ee-412e-afbb-8db64082e4d0"))
                    .title("First")
                    .build();

            Conversation second = Conversation.builder()
                    .id(UUID.fromString("5f4f9330-6c5a-401e-a3a5-e2e28882203a"))
                    .title("Second")
                    .build();
            conversationService.create(first);
            conversationService.create(second);
        }
    }

    private void initializeUsers() {
        if(userService.findAll().isEmpty()) {
            User admin = User.builder()
                    .id(UUID.fromString("54c53da7-849a-4b93-8822-9006c494ca62"))
                    .nickname("Admin")
                    .build();
            userService.create(admin);
        }
    }

    private void bindUsersAndConversations() {
        User user = userService.findAll().stream().findFirst().get();
        Conversation conversation = conversationService.findAll().stream().findFirst().get();
        user.setConversations(List.of(conversation));
        conversation.setUsers(List.of(user));
        userService.replace(user);
        conversationService.replace(conversation);
    }
}
