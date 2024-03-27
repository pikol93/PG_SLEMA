import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class UpcomingEventsWidget extends StatefulWidget {
  const UpcomingEventsWidget({super.key});

  @override
  State<UpcomingEventsWidget> createState() => _UpcomingEventsWidgetState();
}

class _UpcomingEventsWidgetState extends State<UpcomingEventsWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      shadow: false,
      padding: const EdgeInsets.all(15),
      child: _buildNoUpcomingEventsWidget(),
    );
  }

  Widget _buildNoUpcomingEventsWidget() {
    return Text(
      "Brak nadchodzących wydarzeń",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
    );
  }
}
