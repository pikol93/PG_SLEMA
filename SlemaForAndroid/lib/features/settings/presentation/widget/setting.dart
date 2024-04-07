import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  final Widget child;

  const Setting({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            child,
          ],
        ),
        const Divider(
          thickness: 2.0,
        ),
      ],
    );
  }
}
