import 'package:flutter/material.dart';

class ChatMessageTextFormField extends StatefulWidget {
  final double maxHeight;
  final TextEditingController controller;
  const ChatMessageTextFormField(
      {super.key, required this.maxHeight, required this.controller});

  @override
  State<ChatMessageTextFormField> createState() =>
      _ChatMessageTextFormFieldState();
}

class _ChatMessageTextFormFieldState extends State<ChatMessageTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        constraints: BoxConstraints(maxHeight: widget.maxHeight),
        child: TextFormField(
          controller: widget.controller,
          minLines: 1,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            hintText: 'Wpisz wiadomość...',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(12.0),
          ),
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(height: 1.0, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
