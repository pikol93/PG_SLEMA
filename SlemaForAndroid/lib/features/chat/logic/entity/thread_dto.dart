import 'package:pg_slema/utils/data/dto.dart';

class ThreadDto implements Dto {
  @override
  final String id;
  final String title;
  final String lastMessageContent;
  final String lastMessageDateTime;
  final String lastMessageSenderName;
  ThreadDto(this.id, this.title, this.lastMessageContent,
      this.lastMessageDateTime, this.lastMessageSenderName);
}
