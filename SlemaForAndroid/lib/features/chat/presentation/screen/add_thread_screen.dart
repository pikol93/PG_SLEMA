import 'package:flutter/material.dart';
import 'package:pg_slema/features/chat/logic/entity/chat_message.dart';
import 'package:pg_slema/features/chat/logic/service/messages/messages_service.dart';
import 'package:pg_slema/features/chat/presentation/controller/add_thread_controller.dart';
import 'package:pg_slema/features/chat/presentation/screen/thread_chat_screen.dart';
import 'package:pg_slema/features/chat/presentation/widget/chat_message_input.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/forms/text_input.dart';
import 'package:pg_slema/utils/widgets/unfocus_on_children_tap.dart';

class AddThreadScreen extends StatefulWidget {
  final AddThreadController controller;
  final MessagesService messagesService;
  const AddThreadScreen(
      {super.key, required this.controller, required this.messagesService});

  @override
  State<AddThreadScreen> createState() => _AddThreadScreenState();
}

class _AddThreadScreenState extends State<AddThreadScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return UnfocusOnChildrenTap(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const DefaultAppBar(title: "Utwórz wątek"),
            DefaultBody(
              child: Column(
                children: [
                  Container(height: 20),
                  CustomTextFormField(
                    onChanged: _onThreadNameChanged,
                    label: "Nazwij wątek",
                  ),
                ],
              ),
            ),
            ChatMessageInput(onSendPressed: _onThreadAdded),
          ],
        ),
      ),
    );
  }

  void _onThreadNameChanged(String newName) {
    widget.controller.threadName = newName.trim(); //Blank messages not allowed
  }

  void _onThreadAdded(String message) {
    widget.controller.message = message.trim(); //Blank messages not allowed
    //Additional validation using form
    if ((_formKey.currentState?.validate() ?? true) &
        widget.controller.isValid()) {
      print("TODO - you've just sent a message, handle it");
      widget.messagesService.sendMessage(widget.controller.createChatMessage());
      _moveToThreadChatScreen();
    }
  }

  void _moveToThreadChatScreen() {
    Navigator.pop(context);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ThreadChatScreen()));
  }
}
