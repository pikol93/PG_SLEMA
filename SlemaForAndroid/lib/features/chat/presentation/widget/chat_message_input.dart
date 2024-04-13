import 'package:flutter/material.dart';
import 'package:pg_slema/features/chat/presentation/widget/chat_message_text_form_field.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class ChatMessageInput extends StatelessWidget with Logger {
  final double _defaultM3BottomAppBarHeight = 80.0;
  final double _maxBottomAppBarHeightScaleFactor = 1.5;
  final TextEditingController textEditingController = TextEditingController();
  final ValueSetter<String>? onSendPressed;
  ChatMessageInput({super.key, this.onSendPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(minHeight: _defaultM3BottomAppBarHeight),
          child: Card(
            color: Theme.of(context).primaryColor,
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 20),
                ChatMessageTextFormField(
                    maxHeight: _defaultM3BottomAppBarHeight *
                        _maxBottomAppBarHeightScaleFactor,
                    controller: textEditingController),
                Container(width: 10),
                IconButton(
                  onPressed: onSendIconButtonPressed,
                  icon: const Icon(Icons.send),
                ),
                Container(width: 10),
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
      ],
    );
  }

  void onSendIconButtonPressed() {
    if (onSendPressed == null) {
      return;
    }
    onSendPressed!(textEditingController.text);
  }
}
