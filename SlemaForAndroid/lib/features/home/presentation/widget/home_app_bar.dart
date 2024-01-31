import 'package:flutter/material.dart';

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
              color: const Color(0xFF133150),
              size: 48.0,
            ),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
              color: const Color(0xFF133150),
              height: 0.0,
              fontSize: 64,
            ),
        title: const Text("Dzień dobry!"),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(bottom: 12.0, right: 12.0),
            icon: const Icon(Icons.settings),
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
