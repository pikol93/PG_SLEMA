import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/presentation/controller/date_picker_controller.dart';

class CalendarExactDatePicker extends StatelessWidget {
  final DatePickerController controller;
  final ValueSetter<DateTime> onDatePicked;

  const CalendarExactDatePicker(
      {super.key, required this.onDatePicked, required this.controller});

  void Function()? handleDatePick(BuildContext context) {
    return () async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: controller.selectedDate,
        firstDate: controller.allowedFirstDate,
        lastDate: controller.allowedLastDate,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
      );

      if (pickedDate != null) {
        controller.selectedDate = pickedDate;
        onDatePicked(pickedDate);
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: handleDatePick(context),
      style: Theme.of(context).iconButtonTheme.style?.copyWith(
            iconColor: MaterialStatePropertyAll(
              Theme.of(context).colorScheme.onPrimary,
            ),
            iconSize: const MaterialStatePropertyAll(30),
          ),
      icon: const Icon(
        Icons.calendar_month,
        shadows: [Shadow(color: Colors.transparent)],
      ),
    );
  }
}
