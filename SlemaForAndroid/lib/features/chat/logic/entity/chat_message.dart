class ChatMessage {
  final String senderID;
  final String content;
  final DateTime dateTime;
  final String threadID;
  final String threadTitle;

  ChatMessage(this.senderID, this.content, this.dateTime, this.threadID,
      this.threadTitle);
}
