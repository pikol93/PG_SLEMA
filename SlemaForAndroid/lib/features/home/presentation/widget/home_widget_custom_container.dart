import 'package:flutter/material.dart';

class HomeWidgetCustomContainer extends StatelessWidget {
  final Widget child;
  const HomeWidgetCustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final double screenWidthMargin = MediaQuery.of(context).size.width * 0.04;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin:
          EdgeInsets.only(left: screenWidthMargin, right: screenWidthMargin),
      child: Material(
        color: Theme.of(context).colorScheme.primaryContainer,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: const BorderSide(width: 3.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: child,
        ),
      ),
    );
  }
}
