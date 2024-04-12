import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/features/chat/presentation/widget/chat_message_input.dart';
import 'package:pg_slema/utils/widgets/unfocus_on_children_tap.dart';
import 'package:pg_slema/features/chat/logic/service/messages/messages_service.dart';

class ThreadChatScreen extends StatefulWidget {
  final MessagesService messagesService;
  final String threadID;

  const ThreadChatScreen(
      {super.key, required this.messagesService, required this.threadID});

  @override
  State<ThreadChatScreen> createState() => _ThreadChatScreenState();
}

class _ThreadChatScreenState extends State<ThreadChatScreen> {
  @override
  Widget build(BuildContext context) {
    return UnfocusOnChildrenTap(
      child: Column(
        children: [
          const DefaultAppBar(title: "TODO"),
          const DefaultBody(child: Text("TODO")),
          ChatMessageInput(onSendPressed: _onMessageSend),
        ],
      ),
    );
  }

  void _onMessageSend(String message) {}
}
