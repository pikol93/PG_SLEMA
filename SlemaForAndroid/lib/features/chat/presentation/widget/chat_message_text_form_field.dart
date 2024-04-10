import 'package:flutter/material.dart';

class ChatMessageTextFormField extends StatefulWidget {
  final double maxHeight;
  const ChatMessageTextFormField({super.key, required this.maxHeight});

  @override
  State<ChatMessageTextFormField> createState() =>
      _ChatMessageTextFormFieldState();
}

class _ChatMessageTextFormFieldState extends State<ChatMessageTextFormField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        constraints: BoxConstraints(maxHeight: widget.maxHeight),
        child: TextFormField(
          controller: _controller,
          minLines: 1,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Wpisz wiadomość...',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(8.0),
          ),
        ),
      ),
    );
  }
}
