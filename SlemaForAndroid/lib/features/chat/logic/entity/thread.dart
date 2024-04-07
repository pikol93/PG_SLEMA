import 'package:pg_slema/features/chat/logic/entity/last_message.dart';

class Thread {
  final String id;
  final String title;
  final LastMessage lastMessage;
  Thread(this.id, this.title, this.lastMessage);
}
