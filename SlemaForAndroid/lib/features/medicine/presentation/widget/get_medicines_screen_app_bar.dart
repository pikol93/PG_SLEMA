import 'package:flutter/material.dart';

class GetMedicinesScreenAppBar extends StatelessWidget {
  const GetMedicinesScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Padding(
        padding: EdgeInsets.only(left: 8.0, top: 24.0),
        child: Text('Lekarstwa'),
      ),
      floating: false,
      pinned: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
            color: const Color(0xFF133150), //TODO
            height: 0,
            fontSize: 86,
          ),
      toolbarHeight: 120,
    );
  }
}
