import 'package:flutter/material.dart';

class UnfocusOnChildrenTap extends StatelessWidget {
  final Widget child;
  const UnfocusOnChildrenTap({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocusOnTap(context),
      child: child,
    );
  }

  void unfocusOnTap(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.focusedChild?.unfocus();
    }
  }
}
