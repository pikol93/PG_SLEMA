import 'package:flutter/material.dart';

class DefaultFloatingActionButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  const DefaultFloatingActionButton(
      {super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16.0,
      right: 16.0,
      child: FloatingActionButton(
        onPressed: () {
          onPressed();
        },
        child: child,
      ),
    );
  }
}
