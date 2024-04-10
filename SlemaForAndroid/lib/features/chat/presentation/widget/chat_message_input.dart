import 'package:flutter/material.dart';
import 'package:pg_slema/features/chat/presentation/widget/chat_message_text_form_field.dart';

class ChatMessageInput extends StatelessWidget {
  final double _defaultM3BottomAppBarHeight = 80.0;
  final double _maxBottomAppBarHeightScaleFactor = 1.5;
  const ChatMessageInput({super.key});

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
                ),
                Container(width: 10),
                IconButton(
                  onPressed: onSendIconPressed,
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

  void onSendIconPressed() {}
}
