import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

import 'package:pg_slema/features/upcoming_events/presentation/controller/upcoming_events_widget_controller.dart';

class UpcomingEventsWidget extends StatefulWidget {
  final UpcomingEventsWidgetController controller =
      UpcomingEventsWidgetController();
  UpcomingEventsWidget({super.key});

  @override
  State<UpcomingEventsWidget> createState() => _UpcomingEventsWidgetState();
}

class _UpcomingEventsWidgetState extends State<UpcomingEventsWidget> {
  late List events;

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      shadow: false,
      padding: const EdgeInsets.all(15),
      child: _buildNoUpcomingEventsWidget(),
    );
  }

  Widget _buildUpcomingEventsWidget() {
    return Text(
      "Masz nadchodzące wydarzenia",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
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
