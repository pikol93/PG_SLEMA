package pg.slema.initializer;

import lombok.SneakyThrows;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.service.ConversationService;
import pg.slema.message.entity.Message;
import pg.slema.message.service.MessageService;
import pg.slema.user.entity.User;
import pg.slema.user.service.UserService;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;
import java.util.UUID;

@Component
public class InitializeData implements InitializingBean {

    private final UserService userService;

    private final ConversationService conversationService;

    private final MessageService messageService;

    @Autowired
    public InitializeData(UserService userService,
                          ConversationService conversationService,
                          MessageService messageService) {
        this.userService = userService;
        this.conversationService = conversationService;
        this.messageService = messageService;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        initializeUsers();
        initializeConversations();
        bindFirstConversation();
        bindSecondConversation();
        bindThirdConversation();
        bindFourthConversation();
        addMessagesToFirstConversation();
        addMessagesToSecondConversation();
        addMessagesToThirdConversation();
        addMessagesToFourthConversation();
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

    private void addMessagesToFirstConversation() {
        User firstUser = userService.findAll().get(0);
        Conversation firstConversation = conversationService.findAll().get(0);

        Message firstMessage = Message.builder()
                .id(UUID.randomUUID())
                .sender(firstUser)
                .conversation(firstConversation)
                .content("Halo")
                .build();

        messageService.create(firstMessage);
    }

    private void addMessagesToSecondConversation() {
        User firstUser = userService.findAll().get(0);
        User secondUser = userService.findAll().get(1);
        Conversation secondConversation = conversationService.findAll().get(1);

        Message firstMessage = Message.builder()
                .id(UUID.randomUUID())
                .sender(secondUser)
                .conversation(secondConversation)
                .content("Potrzebuje pomocy")
                .build();

        Message secondMessage = Message.builder()
                .id(UUID.randomUUID())
                .sender(firstUser)
                .conversation(secondConversation)
                .content("W czym pomóc?")
                .build();

        Message thirdMessage = Message.builder()
                .id(UUID.randomUUID())
                .sender(secondUser)
                .conversation(secondConversation)
                .content("Ganczarenko")
                .build();

        messageService.create(firstMessage);
        messageService.create(secondMessage);
        messageService.create(thirdMessage);
    }

    private void addMessagesToThirdConversation() {
        User firstUser = userService.findAll().get(0);
        User secondUser = userService.findAll().get(1);
        User thirdUser = userService.findAll().get(2);
        Conversation thirdConversation = conversationService.findAll().get(2);

        Message firstMessage = Message.builder()
                .id(UUID.randomUUID())
                .sender(thirdUser)
                .conversation(thirdConversation)
                .content("Mam problem")
                .dateTime(simulateMessageDelay())
                .build();

        Message secondMessage = Message.builder()
                .id(UUID.randomUUID())
                .sender(secondUser)
                .conversation(thirdConversation)
                .content("Jaki problem?")
                .dateTime(simulateMessageDelay())
                .build();

        Message thirdMessage = Message.builder()
                .id(UUID.randomUUID())
                .sender(thirdUser)
                .conversation(thirdConversation)
                .content("Zaatakował mnie ganczar w sprawie parówek")
                .dateTime(simulateMessageDelay())
                .build();

        Message bonusMessage = Message.builder()
                .id(UUID.randomUUID())
                .sender(thirdUser)
                .conversation(thirdConversation)
                .content("Pomóżcie bo mnie zamkną w DLL i zrobią ze mnie COMA")
                .dateTime(simulateMessageDelay())
                .build();

        Message fourthMessage = Message.builder()
                .id(UUID.randomUUID())
                .sender(secondUser)
                .conversation(thirdConversation)
                .content("Przesyłam sprawę do specjalistów")
                .dateTime(simulateMessageDelay())
                .build();

        Message fifthMessage = Message.builder()
                .id(UUID.randomUUID())
                .sender(firstUser)
                .conversation(thirdConversation)
                .content("Łok łok łok, łokend łoł!")
                .dateTime(simulateMessageDelay())
                .build();

        Message sixthMessage = Message.builder()
                .id(UUID.randomUUID())
                .sender(thirdUser)
                .conversation(thirdConversation)
                .content("Podziękuję za taką pomoc")
                .dateTime(simulateMessageDelay())
                .build();

        messageService.create(firstMessage);
        messageService.create(secondMessage);
        messageService.create(thirdMessage);
        messageService.create(fourthMessage);
        messageService.create(fifthMessage);
        messageService.create(sixthMessage);
        messageService.create(bonusMessage);
    }

    private void addMessagesToFourthConversation() {
        User firstUser = userService.findAll().get(0);
        User secondUser = userService.findAll().get(1);
        Conversation fourthConversation = conversationService.findAll().get(3);

        Message firstMessage = Message.builder()
                .id(UUID.randomUUID())
                .sender(firstUser)
                .conversation(fourthConversation)
                .content("No to jak, towarzysze, pomożecie?")
                .build();

        Message secondMessage = Message.builder()
                .id(UUID.randomUUID())
                .sender(secondUser)
                .conversation(fourthConversation)
                .content("Pomożemy!")
                .build();

        messageService.create(firstMessage);
        messageService.create(secondMessage);
    }
    
    @SneakyThrows
    private LocalDateTime simulateMessageDelay() {
        int delayTime = new Random().nextInt(5);
        Thread.sleep(delayTime * 100);
        return LocalDateTime.now();
    }
}
