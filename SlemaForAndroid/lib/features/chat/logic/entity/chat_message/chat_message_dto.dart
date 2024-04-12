import 'package:pg_slema/features/chat/logic/entity/chat_message/chat_message.dart';

class ChatMessageDto {
  final String senderID;
  final String senderName;
  final String content;
  final String dateTime;

  ChatMessageDto(this.senderID, this.content, this.dateTime, this.senderName);

  @override
  String toString() {
    return "senderName: $senderName\n"
        "senderID: $senderID\n"
        "dateTime: $dateTime\n"
        "content: $content\n";
  }

  static ChatMessageDto fromJson(Map<String, dynamic> json, String threadID) {
    // if (!json.containsKey('id')) {
    //   throw const FormatException("Missing 'id' key in JSON");
    // } //TODO?

    Map<String, dynamic> senderInfo = json['sender'];
    String senderName = '';
    String senderID = '';
    if (senderInfo.isNotEmpty) {
      senderID = senderInfo['id'];
      senderName = senderInfo['name'];
    }

    return ChatMessageDto(
        senderID, json['content'], json['dateTime'], senderName);
  }

  Map<String, dynamic> toJson(String threadID) => {
        'senderId': senderID,
        'conversationId': threadID,
        'content': content,
        'dateTime': dateTime,
      };
}
