import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/default_appbar/default_appbar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DefaultAppBar(title: "Kalendarz"),
        Center(
          child: Text(
            "Do dokończenia :)",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}
