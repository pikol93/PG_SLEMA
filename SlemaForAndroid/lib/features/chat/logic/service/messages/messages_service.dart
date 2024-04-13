import 'dart:async';
import 'package:pg_slema/features/chat/logic/entity/chat_message/chat_message.dart';

abstract class MessagesService {
  StreamController<List<ChatMessage>> getHistoryStream();
  StreamController<ChatMessage> getLastMessageStream();
  void sendMessage(ChatMessage chatMessage);
}
