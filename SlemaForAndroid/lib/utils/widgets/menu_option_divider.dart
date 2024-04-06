import 'package:flutter/material.dart';

class MenuOptionDivider extends StatelessWidget {
  const MenuOptionDivider({super.key});

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
