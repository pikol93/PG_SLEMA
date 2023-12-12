import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/controller/calendar_controller.dart';

class CalendarMoveForward extends StatelessWidget {
  final CalendarController controller;
  final void Function(String) onPickedDate;
  const CalendarMoveForward(
      {super.key, required this.onPickedDate, required this.controller});

  void moveForward() {
    controller.addOneDayFromPickedDateIfPossible();
    onPickedDate(controller.getPickedDateStringRepresentationForAppBar());
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_forward,
        color: Colors.black,
      ),
      onPressed: moveForward,
    );
  }
}
