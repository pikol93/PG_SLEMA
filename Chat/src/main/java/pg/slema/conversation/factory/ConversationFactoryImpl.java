package pg.slema.conversation.factory;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pg.slema.chat.dto.ReceivedChatMessage;
import pg.slema.chat.mapper.ReceivedChatMessageConversationMapper;
import pg.slema.conversation.entity.Conversation;
import pg.slema.conversation.notifier.ConversationChangesNotifier;
import pg.slema.conversation.service.ConversationService;
import pg.slema.user.entity.User;
import pg.slema.user.service.UserService;

import java.util.List;
import java.util.Optional;

@Component
public class ConversationFactoryImpl implements ConversationFactory {

    private final ConversationService conversationService;

    private final UserService userService;

    private final ReceivedChatMessageConversationMapper conversationMapper;

    private final ConversationChangesNotifier changesNotifier;

    @Autowired
    public ConversationFactoryImpl(ConversationService conversationService,
                                   UserService userService, ReceivedChatMessageConversationMapper conversationMapper, ConversationChangesNotifier changesNotifier) {
        this.conversationService = conversationService;
        this.userService = userService;
        this.conversationMapper = conversationMapper;
        this.changesNotifier = changesNotifier;
    }

    @Transactional
    @Override
    public Conversation getConversationForReceivedMessage(ReceivedChatMessage message) {
        ReceivedChatMessage.Conversation messageConversation = message.getConversation();
        Optional<User> sender = userService.find(message.getSenderId());
        Optional<Conversation> conversation = conversationService.find(messageConversation.getId());

        if(sender.isEmpty()) {
            throw new RuntimeException("Incorrect message sender"); //TODO make this exception checked
        }

        if(conversation.isEmpty()) {
            return createNewConversation(sender.get(), messageConversation);
        }
        else {
            Conversation existingConversation = conversation.get();
            addParticipantToConversationIfNecessary(existingConversation, sender.get());
            return existingConversation;
        }
    }

    private Conversation createNewConversation(User initiator,
                                               ReceivedChatMessage.Conversation messageConversation) {
        Conversation createdConversation = conversationMapper.apply(initiator.getId(), messageConversation);
        createdConversation.setInitiator(initiator);
        conversationService.create(createdConversation);
        changesNotifier.notifyListenersAboutConversationCreation(createdConversation);
        return createdConversation;
    }

    private void addParticipantToConversationIfNecessary(Conversation conversation, User user) {
        List<User> participants = userService.findParticipantsByConversation(conversation.getId());
        if(!participants.contains(user)) {
            participants.add(user);
            conversation.setParticipants(participants);
            conversationService.replace(conversation);
            changesNotifier.notifyListenersAboutChangesInParticipants(conversation);
        }
    }
}
