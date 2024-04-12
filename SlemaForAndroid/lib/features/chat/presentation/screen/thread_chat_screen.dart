import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/features/chat/presentation/widget/chat_message_input.dart';
import 'package:pg_slema/utils/widgets/unfocus_on_children_tap.dart';
import 'package:pg_slema/features/chat/logic/service/messages/messages_service.dart';
import 'package:pg_slema/features/chat/presentation/widget/message_bubble/message_bubble.dart';

class ThreadChatScreen extends StatefulWidget {
  final MessagesService messagesService;
  final String threadID;
  final String threadTitle;

  const ThreadChatScreen(
      {super.key,
      required this.messagesService,
      required this.threadID,
      required this.threadTitle});

  @override
  State<ThreadChatScreen> createState() => _ThreadChatScreenState();
}

class _ThreadChatScreenState extends State<ThreadChatScreen> {
  @override
  Widget build(BuildContext context) {
    return UnfocusOnChildrenTap(
      child: Column(
        children: [
          DefaultAppBar(title: widget.threadTitle),
          DefaultBody(
            child: ListView(
              children: [
                MessageBubble(
                  message:
                      "A oto moaj wiadomość, którą wysłałem i jest całkiem długa. Bla bla bla bal bal balablablalablalabl...",
                  isSentByMe: true,
                ),
                MessageBubble(
                  message:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec iaculis euismod nisi, a scelerisque urna varius eu. Suspendisse iaculis consectetur nunc et maximus. Donec semper, sapien sit amet tincidunt porta, ligula enim aliquam risus, in molestie ante justo eget magna.",
                  isSentByMe: false,
                )
              ],
            ),
          ),
          ChatMessageInput(onSendPressed: _onMessageSend),
        ],
      ),
    );
  }

  void _onMessageSend(String message) {}
}
