import 'package:flutter/material.dart';
import 'package:pg_slema/custom_icons_icons.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

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
        title: const Text("Dzień dobry!"),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(bottom: 12.0, right: 12.0),
            icon: const Icon(CustomIcons.settings),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('TODO ustawienia')));
            },
          ),
        ],
      ),
    );
  }
}
