import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final double _radius = 24.0;
  final double _colorOpacity = 0.8;
  final double _padding = 16.0;
  final String message;
  final bool isSentByMe;
  const MessageBubble(
      {super.key, required this.message, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: EdgeInsets.all(_padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(isSentByMe ? _radius : 0),
            bottomRight: Radius.circular(isSentByMe ? 0 : _radius),
            topLeft: Radius.circular(_radius),
            topRight: Radius.circular(_radius),
          ),
          color: isSentByMe
              ? Theme.of(context).colorScheme.primary.withOpacity(_colorOpacity)
              : Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withOpacity(_colorOpacity), //TODO
        ),
        child: Text(
          message,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: isSentByMe
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSecondary),
        ),
      ),
    );
  }
}
