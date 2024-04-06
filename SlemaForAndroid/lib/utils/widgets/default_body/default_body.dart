import 'package:flutter/material.dart';

class DefaultBody extends StatelessWidget {
  final Widget child;
  final double mainWidgetsPaddingHorizontal;

  const DefaultBody({
    super.key,
    required this.child,
    this.mainWidgetsPaddingHorizontal = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Material(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mainWidgetsPaddingHorizontal,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
