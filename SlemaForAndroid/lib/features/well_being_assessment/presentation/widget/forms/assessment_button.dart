import 'package:flutter/material.dart';

class AssessmentButton extends StatelessWidget {
  const AssessmentButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.minimumSize = const Size(48, 16),
    this.textStyle = const TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
  });

  final String text;
  final VoidCallback onPressed;
  final EdgeInsets padding;
  final Size minimumSize;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padding,
          minimumSize: minimumSize,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
