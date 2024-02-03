import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/controller/calendar_controller.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/calendar_functionality_widgets/calendar_exact_date_picker.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/calendar_functionality_widgets/calendar_move_backward.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/calendar_functionality_widgets/calendar_move_forward.dart';
import 'package:pg_slema/features/medicine/presentation/controller/date_picker_controller.dart';

class CalendarWithArrows extends StatefulWidget {
  final DateTime initDate;
  final ValueChanged<DateTime> onDateChanged;

  const CalendarWithArrows(
      {super.key, required this.onDateChanged, required this.initDate});

  @override
  State<StatefulWidget> createState() => _CalendarWithArrowsState();
}

class _CalendarWithArrowsState extends State<CalendarWithArrows> {
  late CalendarController controller;

  @override
  void initState() {
    controller = CalendarController(widget.initDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.setLanguage(context);
    return Row(
      children: [
        CalendarExactDatePicker(
          onDatePicked: _onDatePicked,
          controller: DatePickerController(
              controller.firstDate, controller.lastDate, controller.pickedDate),
        ),
        CalendarMoveBackward(
          onPressed: _onBackwardPressed,
        ),
        Expanded(
          child: Text(
            controller.getPickedDateStringRepresentationForAppBar(),
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        CalendarMoveForward(
          onPressed: _onForwardPressed,
        ),
        //const MealIdeaIconButton(),
      ],
    );
  }

  void _onBackwardPressed() {
    DateTime date = controller.pickedDate;
    controller.subtractOneDayFromPickedDateIfPossible();
    _notifyAboutDateChangedIfItChanged(date);
    setState(() {});
  }

  void _onForwardPressed() {
    DateTime date = controller.pickedDate;
    controller.addOneDayFromPickedDateIfPossible();
    _notifyAboutDateChangedIfItChanged(date);
    setState(() {});
  }

  void _onDatePicked(DateTime value) {
    DateTime date = controller.pickedDate;
    controller.pickedDate = value;
    _notifyAboutDateChangedIfItChanged(date);
    setState(() {});
  }

  void _notifyAboutDateChangedIfItChanged(DateTime previousDate) {
    if (previousDate != controller.pickedDate) {
      widget.onDateChanged(controller.pickedDate);
    }
  }
}
