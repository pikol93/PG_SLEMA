import 'package:pg_slema/features/chat/logic/entity/thread/thread_dto.dart';
import 'package:pg_slema/features/chat/logic/entity/thread/last_message.dart';
import 'package:pg_slema/features/chat/logic/entity/thread/thread.dart';

class ThreadDtoConverter {
  static Thread fromDto(ThreadDto dto) {
    DateTime? lastMessageDateTime = DateTime.tryParse(dto.lastMessageDateTime);

    LastMessage l = LastMessage(
      dto.lastMessageContent,
      dto.lastMessageSenderName,
      lastMessageDateTime ?? DateTime.now(),
    );

    return Thread(dto.id, dto.title, l);
  }

  static ThreadDto toDto(Thread thread) {
    return ThreadDto(
      thread.id,
      thread.title,
      thread.lastMessage.content,
      "${thread.lastMessage.dateTime.toIso8601String()}Z", //TODO
      thread.lastMessage.senderName,
    );
  }
}
