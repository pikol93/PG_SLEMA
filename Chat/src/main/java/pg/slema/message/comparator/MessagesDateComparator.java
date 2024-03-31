package pg.slema.message.comparator;

import org.springframework.stereotype.Component;
import pg.slema.message.entity.Message;

import java.time.LocalDateTime;
import java.util.Comparator;

@Component
public class MessagesDateComparator implements Comparator<Message> {
    @Override
    public int compare(Message o1, Message o2) {
        LocalDateTime d1 = o1.getDateTime();
        LocalDateTime d2 = o2.getDateTime();
        return d1.compareTo(d2);
    }
}
