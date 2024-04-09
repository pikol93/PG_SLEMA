import 'package:flutter/material.dart';
import 'package:pg_slema/features/chat/presentation/controller/add_thread_controller.dart';
import 'package:pg_slema/features/chat/presentation/widget/chat_message_input.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/forms/text_input.dart';
import 'package:pg_slema/utils/widgets/unfocus_on_children_tap.dart';

class AddThreadScreen extends StatefulWidget {
  final AddThreadController controller;
  const AddThreadScreen({super.key, required this.controller});

  @override
  State<AddThreadScreen> createState() => _AddThreadScreenState();
}

class _AddThreadScreenState extends State<AddThreadScreen> {
  @override
  Widget build(BuildContext context) {
    return UnfocusOnChildrenTap(
      child: Column(
        children: [
          const DefaultAppBar(title: "Utwórz wątek"),
          DefaultBody(
            child: Column(
              children: [
                Container(height: 20),
                CustomTextFormField(
                  onChanged: (value) => widget.controller.thread = value,
                  label: "Nazwij wątek",
                ),
              ],
            ),
          ),
          const ChatMessageInput(),
        ],
      ),
    );
  }
}
