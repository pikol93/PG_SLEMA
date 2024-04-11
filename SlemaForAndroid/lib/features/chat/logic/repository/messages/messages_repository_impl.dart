import 'package:pg_slema/features/chat/logic/entity/chat_message/chat_message.dart';
import 'package:pg_slema/features/chat/logic/repository/messages/messages_repository.dart';

class MessagesRepositoryImpl implements MessagesRepository {
  @override
  Future<List<ChatMessage>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<ChatMessage> getLastMessage() {
    // TODO: implement getLastMessage
    throw UnimplementedError();
  }

  @override
  Future save(ChatMessage message) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
