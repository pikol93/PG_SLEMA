class ChatMessageDto {
  final String senderID;
  final String content;
  final String dateTime;
  final String threadID;
  final String threadTitle;

  ChatMessageDto(this.senderID, this.content, this.dateTime, this.threadID,
      this.threadTitle);
}
