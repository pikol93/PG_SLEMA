import 'package:pg_slema/features/chat/logic/entity/chat_message/chat_message_dto.dart';
import 'package:pg_slema/features/chat/logic/entity/chat_message/chat_message.dart';

class ChatMessageDtoConverter {
  static ChatMessage fromDto(ChatMessageDto dto) {
    DateTime? messageDateTime = DateTime.tryParse(dto.dateTime);
    return ChatMessage(dto.senderID, dto.senderName, dto.content,
        messageDateTime ?? DateTime.now());
  }

  static ChatMessageDto toDto(ChatMessage message) {
    return ChatMessageDto(
        message.senderID,
        message.content,
        "${message.dateTime.toIso8601String()}Z", //TODO
        message.senderName);
  }
}
