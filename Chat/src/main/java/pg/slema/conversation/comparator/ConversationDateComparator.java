package pg.slema.conversation.comparator;

import org.springframework.stereotype.Component;
import pg.slema.conversation.entity.Conversation;

import java.time.ZonedDateTime;
import java.util.Comparator;

@Component
public class ConversationDateComparator implements Comparator<Conversation> {
    @Override
    public int compare(Conversation o1, Conversation o2) {
        try {
            ZonedDateTime d1 = o1.getLastMessage().getDateTime();
            ZonedDateTime d2 = o2.getLastMessage().getDateTime();
            return d2.compareTo(d1);
        } catch (NullPointerException e) {
            return 0;
        }
    }
}
