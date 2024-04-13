import 'dart:async';
import 'package:pg_slema/features/chat/logic/entity/chat_message/chat_message.dart';

abstract class MessagesService {
  Stream<List<ChatMessage>> getHistoryStream();
  Stream<ChatMessage> getLastMessageStream();
}
