import 'package:pg_slema/features/chat/logic/entity/chat_message.dart';

abstract class MessagesRepository {
  Future<List<ChatMessage>> getAll();
  Future<ChatMessage> getLastMessage();
  Future save(ChatMessage message);
}
