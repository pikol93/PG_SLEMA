import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/features/chat/presentation/widget/chat_message_input.dart';
import 'package:pg_slema/utils/widgets/unfocus_on_children_tap.dart';

class ThreadChatScreen extends StatelessWidget {
  const ThreadChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UnfocusOnChildrenTap(
      child: Column(
        children: [
          const DefaultAppBar(title: "Nazwa watku TODO"),
          const DefaultBody(child: Text("TODO")),
          ChatMessageInput(onSendPressed: _onMessageSend),
        ],
      ),
    );
  }

  void _onMessageSend(String message) {}
}
