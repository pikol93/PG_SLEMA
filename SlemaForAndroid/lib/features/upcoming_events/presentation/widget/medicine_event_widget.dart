import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
import 'package:pg_slema/features/upcoming_events/presentation/controller/medicine_event_widget_controller.dart';

class MedicineEventWidget extends StatelessWidget {
  final bool isLastInList;
  final Medicine medicine;
  late final MedicineEventWidgetController _controller;
  MedicineEventWidget(
      {super.key, required this.medicine, required this.isLastInList}) {
    _controller = MedicineEventWidgetController();
  }

  @override
  Widget build(BuildContext context) {
    _controller.setLanguage(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          medicine.name,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(fontWeight: FontWeight.w600, height: 0.6),
        ),
        Text(
          _controller.getIntakeDateRepresentationBasedOnFrequency(medicine),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.0),
        ),
        if (!isLastInList)
          const Divider(
            thickness: 2,
            height: 10,
          )
      ],
    );
  }
}
