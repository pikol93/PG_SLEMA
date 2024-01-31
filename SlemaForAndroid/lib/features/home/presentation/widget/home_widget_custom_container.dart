import 'package:flutter/material.dart';

class HomeWidgetCustomContainer extends StatelessWidget {
  final Widget child;
  const HomeWidgetCustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final double screenWidthMargin = MediaQuery.of(context).size.width * 0.08;
    return Container(
      margin:
          EdgeInsets.only(left: screenWidthMargin, right: screenWidthMargin),
      child: Material(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: const BorderSide(
            color: Color(0xFF133150), //TODO
            width: 3.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: child,
        ),
      ),
    );
  }
}
