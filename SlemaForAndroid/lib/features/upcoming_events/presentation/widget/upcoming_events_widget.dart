import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';
import 'package:pg_slema/features/upcoming_events/presentation/controller/upcoming_events_widget_controller.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';

class UpcomingEventsWidget extends StatefulWidget {
  final UpcomingEventsWidgetController controller =
      UpcomingEventsWidgetController();
  UpcomingEventsWidget({super.key});

  @override
  State<UpcomingEventsWidget> createState() => _UpcomingEventsWidgetState();
}

class _UpcomingEventsWidgetState extends State<UpcomingEventsWidget>
    with Logger {
  late Future<List> _eventsFuture;

  @override
  void initState() {
    super.initState();
    _eventsFuture = widget.controller.getUpcomingEvents();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      shadow: false,
      padding: const EdgeInsets.all(15),
      child: FutureBuilder<List>(
        future: _eventsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingPlaceholderWidget();
          } else if (snapshot.hasError) {
            logger.error(
                "Error while fetching upcoming events data: ${snapshot.error}");
            return _buildNoUpcomingEventsWidget();
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return _buildUpcomingEventsWidget(snapshot.data!);
          } else {
            // No upcoming events
            return _buildNoUpcomingEventsWidget();
          }
        },
      ),
    );
  }

  Widget _buildLoadingPlaceholderWidget() {
    return Container();
    // TODO https://docs.flutter.dev/cookbook/effects/shimmer-loading
  }

  Widget _buildUpcomingEventsWidget(List list) {
    List<Medicine> medicines =
        list.map((item) => item as Medicine).cast<Medicine>().toList();
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (context, index) {
          return Text(medicines[index].name);
        },
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
