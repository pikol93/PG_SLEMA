import 'package:pg_slema/features/chat/logic/entity/chat_message.dart';
import 'package:uuid/v4.dart';

class AddThreadController {
  String threadName = "";
  String message = "";

  bool isValid() {
    return threadName.isNotEmpty;
  }

  ChatMessage createChatMessage() {
    //TODO
    return ChatMessage(UuidV4().toString(), message, DateTime.now(),
        UuidV4().toString(), threadName);
  }
}
