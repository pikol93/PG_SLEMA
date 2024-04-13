class ChatMessage {
  final String senderID;
  final String senderName;
  final String content;
  final DateTime dateTime;
  ChatMessage(this.senderID, this.senderName, this.content, this.dateTime);
  bool isSentByMe(String myID) {
    return senderID == myID;
  }
}
