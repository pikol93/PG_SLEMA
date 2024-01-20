import 'package:flutter/material.dart';

class AssessmentButton extends StatelessWidget {
  const AssessmentButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.margin = const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.minimumSize = const Size(48, 16),
    this.textStyle = const TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
    this.boxColor = Colors.grey,
  });

  final String text;
  final VoidCallback onPressed;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Size minimumSize;
  final TextStyle textStyle;
  final Color boxColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Container(
        decoration: BoxDecoration(
          color: boxColor,
          border: Border.all(color: Colors.black, width: 2),
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
      ),
    );
  }
}
