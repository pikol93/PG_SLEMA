import 'package:flutter/material.dart';

class MenuScreenDivider extends StatelessWidget {
  const MenuScreenDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Divider(
        thickness: 2.0,
      ),
    );
  }
}
