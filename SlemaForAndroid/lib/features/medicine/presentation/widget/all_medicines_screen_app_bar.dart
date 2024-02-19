import 'package:flutter/material.dart';

class AllMedicinesScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AllMedicinesScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.only(left: 30.0, top: 24.0),
        child: Text('Lekarstwa'),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
            color: const Color(0xFF133150), //TODO
            height: 0,
            fontSize: 86,
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
