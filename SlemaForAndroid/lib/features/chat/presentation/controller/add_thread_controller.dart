import 'package:pg_slema/features/chat/logic/entity/thread/last_message.dart';
import 'package:uuid/uuid.dart';
import 'package:pg_slema/features/chat/logic/entity/thread/thread.dart';

class AddThreadController {
  String threadTitle = "";
  String message = "";

  bool isValid() {
    return threadTitle.isNotEmpty & message.isNotEmpty;
  }

  Thread createNewThreadWithRandomID() {
    //TODO Add user
    return Thread(
      const Uuid().v4(),
      threadTitle,
      LastMessage(
        message,
        "UserTODO",
        DateTime.now(),
      ),
    );
  }
}
