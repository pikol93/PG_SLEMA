import 'dart:async';
import 'dart:convert';
import 'package:pg_slema/features/chat/logic/converter/chat_message_dto_converter.dart';
import 'package:pg_slema/features/chat/logic/entity/chat_message/chat_message.dart';
import 'package:pg_slema/features/chat/logic/repository/messages/messages_repository.dart';
import 'package:pg_slema/features/chat/logic/repository/stomp_client_factory.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_frame.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/features/chat/logic/entity/chat_message/chat_message_dto.dart';

class MessagesRepositoryImpl with Logger implements MessagesRepository {
  final StompClientFactory stompClientFactory;
  final String threadID;

  late StreamController<List<ChatMessage>> _historyStreamController;
  late StreamController<ChatMessage> _messageStreamController;
  late StompClient client;

  MessagesRepositoryImpl({
    required this.stompClientFactory,
    required this.threadID,
  }) {
    _historyStreamController = StreamController<List<ChatMessage>>.broadcast();
    _messageStreamController = StreamController<ChatMessage>.broadcast();
    client = stompClientFactory.createAndActivateStompClient(_onConnect);
  }

  void dispose() {
    _historyStreamController.close();
    _messageStreamController.close();
    client.deactivate();
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

    if (_historyStreamController.isClosed) {
      logger.error(
          "Cannot add history to the history stream controller. HistoryStreamController is closed.");
      return;
    }
    _historyStreamController.add(messages);
  }

  void _onMessageReceived(StompFrame frame) {
    logger.info("Received new message in thread $threadID");
    dynamic jsonData = json.decode(frame.body ?? "");
    ChatMessage message = ChatMessageDtoConverter.fromDto(
        ChatMessageDto.fromJson(jsonData, threadID));

    if (_historyStreamController.isClosed) {
      logger.error(
          "Cannot add history to the message stream controller. MessageStreamController is closed.");
      return;
    }

    _messageStreamController.add(message);
  }

  @override
  StreamController<List<ChatMessage>> getHistoryStream() {
    return _historyStreamController;
  }

  @override
  StreamController<ChatMessage> getLastMessageStream() {
    return _messageStreamController;
  }

  @override
  void sendMessage(ChatMessage chatMessage) {
    client.send(
        destination: '/app/chat/$threadID',
        body: jsonEncode(
            ChatMessageDtoConverter.toDto(chatMessage).toJson(threadID)),
        headers: {});

    logger.info("Sent message in thread $threadID");
  }
}
