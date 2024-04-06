import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/default_circular_button.dart';

class NoThreadsFound extends StatelessWidget {
  const NoThreadsFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Żaden wątek nie został jeszcze utworzony...",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                height: 0.75,
              ),
          textAlign: TextAlign.center,
        ),
        Container(height: 30),
        DefaultCircularButton(onPressed: () {}, label: "Utwórz wątek"),
        Container(height: 50),
      ],
    );
  }
}
