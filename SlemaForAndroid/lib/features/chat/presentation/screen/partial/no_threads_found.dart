import 'package:flutter/material.dart';

class NoThreadsFound extends StatelessWidget {
  const NoThreadsFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Żaden wątek nie został jeszcze utworzony...",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  height: 0.75,
                ),
          ),
        ],
      ),
    );
  }
}
