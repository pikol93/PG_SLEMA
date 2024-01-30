import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context)
            .appBarTheme
            .iconTheme!
            .copyWith(color: const Color(0xFF133150)),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
              color: const Color(0xFF133150),
              height: 0.0,
              fontSize: 56,
            ),
        title: const Text("Dzień dobry!"),
        actions: [
          IconButton(
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
