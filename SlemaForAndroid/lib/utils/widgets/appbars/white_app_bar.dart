import 'package:flutter/material.dart';

class WhiteAppBar extends StatelessWidget {
  final String titleText;

  const WhiteAppBar({
    super.key,
    required this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).appBarTheme.iconTheme!.copyWith(
              color: Theme.of(context).primaryColor,
            ),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
              color: Theme.of(context).primaryColor,
              fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
            ),
        title: Text(titleText),
      ),
    );
  }
}
