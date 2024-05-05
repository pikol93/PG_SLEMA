import 'package:pg_slema/features/chat/logic/entity/thread/last_message.dart';

class Thread {
  final String id;
  final String title;
  final LastMessage lastMessage;
  Thread(this.id, this.title, this.lastMessage);

  @override
  String toString() {
    return "id: $id, "
        "title: $title, "
        "LastMessage: $lastMessage";
  }
}
