import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/controller/calendar_controller.dart';

class CalendarMoveBackward extends StatelessWidget {
  final CalendarController controller;
  final void Function(String) onPickedDate;
  const CalendarMoveBackward(
      {super.key, required this.onPickedDate, required this.controller});

  void moveBackward() {
    controller.subtractOneDayFromPickedDateIfPossible();
    onPickedDate(controller.getPickedDateStringRepresentationForAppBar());
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: moveBackward,
    );
  }
}
