import 'package:flutter/material.dart';

class ChatMessageInput extends StatelessWidget {
  final double _defaultM3BottomAppBarHeight = 80.0;
  const ChatMessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: _defaultM3BottomAppBarHeight,
          child: Card(
            color: Theme.of(context).primaryColor,
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(),
            child: Row(
              children: [
                Container(width: 10),
                const Expanded(
                  child: TextField(),
                ),
                Container(width: 10),
                IconButton(
                  onPressed: onSendIconPressed,
                  icon: const Icon(Icons.send),
                ),
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
