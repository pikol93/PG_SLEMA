import 'dart:async';

import 'package:pg_slema/features/chat/logic/entity/chat_message/chat_message.dart';
import 'package:pg_slema/features/chat/logic/service/messages/messages_service.dart';
import 'package:pg_slema/features/chat/logic/repository/messages/messages_repository.dart';

class MessagesServiceImpl implements MessagesService {
  final MessagesRepository messagesRepository;
  MessagesServiceImpl(this.messagesRepository);

  @override
  Stream<List<ChatMessage>> getHistoryStream() {
    return messagesRepository.getHistoryStream().stream;
  }

  @override
  Stream<ChatMessage> getLastMessageStream() {
    return messagesRepository.getLastMessageStream().stream;
  }
}
