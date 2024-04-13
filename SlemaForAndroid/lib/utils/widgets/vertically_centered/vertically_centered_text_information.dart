import 'package:flutter/material.dart';

class VerticallyCenteredTextInformation extends StatelessWidget {
  final String textInformation;
  const VerticallyCenteredTextInformation(
      {super.key, required this.textInformation});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textInformation,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                height: 0.75,
              ),
          textAlign: TextAlign.center,
        ),
        Container(height: 40),
      ],
    );
  }
}
