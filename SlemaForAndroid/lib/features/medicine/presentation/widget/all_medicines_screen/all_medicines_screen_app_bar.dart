import 'package:flutter/material.dart';

class AllMedicinesScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final toolbarHeight = 80.0;
  const AllMedicinesScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      title: const Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Text('Lekarstwa'),
      ),
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
            color: Theme.of(context).primaryColor,
            fontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
          ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
