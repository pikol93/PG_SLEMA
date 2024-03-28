import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
import 'package:pg_slema/features/upcoming_events/presentation/controller/medicine_event_widget_controller.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';

class MedicineEventWidget extends StatelessWidget {
  final bool isLastInList;
  final Medicine medicine;
  late final MedicineEventWidgetController _controller;
  static const double widgetHeight = 30;
  MedicineEventWidget(
      {super.key, required this.medicine, required this.isLastInList}) {
    _controller = MedicineEventWidgetController();
  }

  @override
  Widget build(BuildContext context) {
    _controller.setLanguage(context);
    return Column(
      children: [
        const SizedBox(height: 3),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: widgetHeight - 6,
              height: widgetHeight - 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 3.0,
                ),
                color: medicine.intakeFrequency.colorFrequencyRepresentation,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicine.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(fontWeight: FontWeight.w600, height: 0.6),
                  ),
                  Text(
                    _controller
                        .getIntakeDateRepresentationBasedOnFrequency(medicine),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(height: 1.0),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (!isLastInList)
          const Divider(
            thickness: 2,
            height: 10,
          ),
      ],
    );
  }
}
