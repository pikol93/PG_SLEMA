import 'dart:convert';
import 'package:pg_slema/features/chat/logic/converter/chat_message_dto_converter.dart';
import 'package:pg_slema/features/chat/logic/entity/chat_message/chat_message.dart';
import 'package:pg_slema/features/chat/logic/repository/messages/messages_repository.dart';
import 'package:pg_slema/features/chat/logic/repository/websocket_repository.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/features/chat/logic/entity/chat_message/chat_message_dto.dart';

class MessagesRepositoryImpl
    with WebsocketRepository, Logger
    implements MessagesRepository {
  final String threadID;
  MessagesRepositoryImpl(this.threadID) {
    client = createAndActivateStompClient(_onConnect);
  }

  void _onConnect(StompFrame frame) {
    client.subscribe(
        destination: '/user/topic/history/$threadID',
        callback: _onHistoryReceived);

    client.subscribe(
        destination: '/topic/messages/$threadID', callback: _onMessageReceived);
  }

  void _onHistoryReceived(StompFrame frame) {
    logger.info("Received history from thread $threadID");
    dynamic jsonData = json.decode(frame.body ?? "");
    List<ChatMessage> messages = (jsonData['messages'] ?? [])
        .map<ChatMessage>((messageJson) => ChatMessageDtoConverter.fromDto(
            ChatMessageDto.fromJson(messageJson, threadID)))
        .toList();
  }

  void _onMessageReceived(StompFrame frame) {
    logger.info("Received new message in thread $threadID");
    dynamic jsonData = json.decode(frame.body ?? "");
    ChatMessage message = jsonData.map<ChatMessage>((messageJson) =>
        ChatMessageDtoConverter.fromDto(
            ChatMessageDto.fromJson(messageJson, threadID)));
  }

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
