import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/controller/calendar_exact_date_picker_controller.dart';

class CalendarExactDatePicker extends StatelessWidget {
  final CalendarExactDatePickerController controller;
  final void Function(String) onPickedDate;
  const CalendarExactDatePicker(
      {super.key, required this.onPickedDate, required this.controller});

  void Function()? handleDatePick(BuildContext context) {
    return () async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: controller.pickedDate,
        firstDate: controller.firstDate,
        lastDate: controller.lastDate,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
      );

      if (pickedDate != null) {
        controller.pickedDate = pickedDate;
        onPickedDate(controller.getPickedDateStringRepresentationForAppBar());
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    controller.setLanguage(context);

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
