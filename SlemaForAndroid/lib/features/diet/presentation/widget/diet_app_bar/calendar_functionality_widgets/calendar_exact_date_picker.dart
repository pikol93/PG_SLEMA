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
    return OutlinedButton(
      onPressed: handleDatePick(context),
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        side: const BorderSide(
          color: Colors.black87,
          width: 1.5,
          strokeAlign: 1.5,
        ),
      ),
      child: const Icon(
        Icons.calendar_month,
        color: Colors.black,
        size: 25,
      ),
    );
  }
}
