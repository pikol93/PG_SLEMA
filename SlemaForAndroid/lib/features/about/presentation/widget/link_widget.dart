import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkWidget extends StatelessWidget {
  final String label;
  final String buttonText;
  final void Function()? onTap;

  const LinkWidget({
    super.key,
    required this.label,
    required this.buttonText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 0.0, 0.0),
          child: RichText(
            text: TextSpan(
              text: buttonText,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(fontWeight: FontWeight.normal),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ),
        ),
      ],
    );
  }
}
