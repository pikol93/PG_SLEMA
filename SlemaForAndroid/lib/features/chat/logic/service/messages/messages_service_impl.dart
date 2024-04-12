import 'package:pg_slema/features/chat/logic/entity/chat_message/chat_message.dart';
import 'package:pg_slema/features/chat/logic/repository/messages/messages_repository_impl.dart';
import 'package:pg_slema/features/chat/logic/repository/websocket_repository.dart';
import 'package:pg_slema/features/chat/logic/service/messages/messages_service.dart';

class MessagesServiceImpl implements MessagesService {
  final MessagesRepositoryImpl messagesRepository;
  MessagesServiceImpl(this.messagesRepository);
  @override
  Future<ChatMessage> getMessage() {
    return messagesRepository.getLastMessage();
  }

  @override
  Future<List<ChatMessage>> getMessages() {
    return messagesRepository.getAll();
  }

  @override
  Future sendMessage(ChatMessage message) {
    return messagesRepository.save(message);
  }
}
