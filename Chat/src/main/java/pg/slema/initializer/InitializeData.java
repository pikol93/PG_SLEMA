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
        bindFirstUser();
        bindSecondUser();
        bindThirdUser();
        bindFirstConversation();
        bindSecondConversation();
        bindThirdConversation();
        bindFourthConversation();
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

            Conversation third = Conversation.builder()
                    .id(UUID.fromString("5f4f9330-6c5a-40aa-a3a5-e2e28882203a"))
                    .title("Third")
                    .build();

            Conversation fourth = Conversation.builder()
                    .id(UUID.fromString("5f4f9330-aa5a-401e-a3a5-e2e28882203a"))
                    .title("Fourth")
                    .build();
            conversationService.create(first);
            conversationService.create(second);
            conversationService.create(third);
            conversationService.create(fourth);
        }
    }

    private void initializeUsers() {
        if(userService.findAll().isEmpty()) {
            User admin = User.builder()
                    .id(UUID.fromString("54c53da7-849a-4b93-8822-9006c494ca62"))
                    .nickname("Admin")
                    .build();

            User volunteer = User.builder()
                    .id(UUID.fromString("aac53da7-849a-4b93-8822-9006c494ca62"))
                    .nickname("Volunteer")
                    .build();

            User typicalUser = User.builder()
                    .id(UUID.fromString("bbc53da7-849a-4b93-8822-9006c494ca62"))
                    .nickname("Typical user")
                    .build();
            userService.create(admin);
            userService.create(volunteer);
            userService.create(typicalUser);
        }
    }

    private void bindFirstUser() {
        User firstUser = userService.findAll().get(0);
        Conversation first = conversationService.findAll().get(0);
        Conversation second = conversationService.findAll().get(1);
        Conversation third = conversationService.findAll().get(2);
        Conversation fourth = conversationService.findAll().get(3);
        firstUser.setInitiatedConversations(List.of(first, fourth));
        firstUser.setParticipatedConversations(List.of(second, third));
        userService.replace(firstUser);
    }

    private void bindSecondUser() {
        User secondUser = userService.findAll().get(1);
        Conversation second = conversationService.findAll().get(1);
        Conversation third = conversationService.findAll().get(2);
        Conversation fourth = conversationService.findAll().get(3);
        secondUser.setInitiatedConversations(List.of(second));
        secondUser.setParticipatedConversations(List.of(third, fourth));
        userService.replace(secondUser);
    }

    private void bindThirdUser() {
        User thirdUser = userService.findAll().get(2);
        Conversation third = conversationService.findAll().get(2);
        thirdUser.setInitiatedConversations(List.of(third));
        userService.replace(thirdUser);
    }

    private void bindFirstConversation() {
        User firstUser = userService.findAll().get(0);
        Conversation first = conversationService.findAll().get(0); //First initialized, nobody participate
        first.setInitiator(firstUser);
        conversationService.replace(first);
    }

    private void bindSecondConversation() {
        User firstUser = userService.findAll().get(0);
        User secondUser = userService.findAll().get(1);
        Conversation second = conversationService.findAll().get(1); //Second initialized, first participate
        second.setInitiator(secondUser);
        second.setParticipants(List.of(firstUser));
        conversationService.replace(second);
    }

    private void bindThirdConversation() {
        User firstUser = userService.findAll().get(0);
        User secondUser = userService.findAll().get(1);
        User thirdUser = userService.findAll().get(2);
        Conversation third = conversationService.findAll().get(2); //Third initialized, first and second participate
        third.setInitiator(thirdUser);
        third.setParticipants(List.of(firstUser, secondUser));
        conversationService.replace(third);
    }

    private void bindFourthConversation() {
        User firstUser = userService.findAll().get(0);
        User secondUser = userService.findAll().get(1);
        Conversation fourth = conversationService.findAll().get(3); //First initialized, second participate
        fourth.setInitiator(firstUser);
        fourth.setParticipants(List.of(secondUser));
        conversationService.replace(fourth);
    }
}
