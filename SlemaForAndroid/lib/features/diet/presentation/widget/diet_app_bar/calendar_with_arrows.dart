import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/controller/calendar_controller.dart';
import 'package:pg_slema/utils/date/date.dart';
import 'package:pg_slema/utils/widgets/calendar_functionality/calendar_exact_date_picker.dart';
import 'package:pg_slema/utils/widgets/calendar_functionality/calendar_move_backward.dart';
import 'package:pg_slema/utils/widgets/calendar_functionality/calendar_move_forward.dart';
import 'package:pg_slema/features/medicine/presentation/controller/date_picker_controller.dart';

class CalendarWithArrows extends StatefulWidget {
  final ValueChanged<DateTime> onDateChanged;
  final DateTime initDate;

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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: CalendarExactDatePicker(
            onDatePicked: _onDatePicked,
            controller: DatePickerController(
              controller.firstDate,
              controller.lastDate,
              controller.pickedDate,
            ),
          ),
        ),
        Flexible(
          child: CalendarMoveBackward(
            onPressed: _onBackwardPressed,
          ),
        ),
        Flexible(
          flex: 3,
          fit: FlexFit.tight,
          child: Text(
            controller.getPickedDateStringRepresentationForAppBar(),
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary, height: 1.0),
            textAlign: TextAlign.center,
          ),
        ),
        Flexible(
          child: CalendarMoveForward(
            onPressed: controller.pickedDate.isToday ? null : _onForwardPressed,
          ),
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
