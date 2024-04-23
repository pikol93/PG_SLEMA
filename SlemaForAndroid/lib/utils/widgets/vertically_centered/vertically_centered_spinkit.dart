import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class VerticallyCenteredSpinkit extends StatelessWidget {
  final double size;
  const VerticallyCenteredSpinkit({super.key, this.size = 60});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitFadingCircle(
          color: Theme.of(context).colorScheme.secondary,
          size: size,
        ),
        Container(height: 40)
      ],
    );
  }
}
