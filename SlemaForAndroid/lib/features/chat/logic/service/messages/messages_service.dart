import 'package:pg_slema/features/chat/logic/entity/chat_message.dart';

abstract class MessagesService {
  Future<ChatMessage> getMessage();
  Future<List<ChatMessage>> getMessages();
  Future sendMessage(ChatMessage message);
}
