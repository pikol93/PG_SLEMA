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

  @override
  String toString() {
    return "id: $id\n"
        "title: $title\n"
        "LastMessageContent: $lastMessageContent\n"
        "LastMessageDateTime: $lastMessageDateTime\n"
        "LastMessageSenderName: $lastMessageSenderName\n";
  }

  static ThreadDto fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('id')) {
      throw const FormatException("Missing 'id' key in JSON");
    }

    Map<String, dynamic> lastMessage = json['lastMessage'];
    String content = '';
    String dateTime = DateTime.now().toString();
    String senderName = '';
    if (lastMessage.isNotEmpty) {
      content = lastMessage['content'];
      dateTime = lastMessage['intakeDate'] ?? DateTime.now().toString();
      Map<String, dynamic> sender = lastMessage['sender'];
      if (lastMessage.isNotEmpty) {
        senderName = sender['name'];
      }
    }

    return ThreadDto(
      json['id'],
      json['title'] ?? '',
      content,
      dateTime,
      senderName,
    );
  }

  static Map<String, dynamic> toJson(ThreadDto dto) => {
        'id': dto.id,
        'title': dto.title,
        'lastMessage': {
          'content': dto.lastMessageContent,
          'dateTime': dto.lastMessageDateTime,
          'sender': {'name': dto.lastMessageSenderName}
        }
      };
}
