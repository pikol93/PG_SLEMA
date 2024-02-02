import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/controller/calendar_controller.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/calendar_functionality_widgets/calendar_exact_date_picker.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/calendar_functionality_widgets/calendar_move_backward.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/calendar_functionality_widgets/calendar_move_forward.dart';
import 'package:pg_slema/features/medicine/presentation/controller/date_picker_controller.dart';

class CalendarWithArrows extends StatefulWidget {
  final CalendarController controller = CalendarController();
  final ValueChanged<DateTime> onDateChanged;

  CalendarWithArrows({super.key, required this.onDateChanged});

  @override
  State<StatefulWidget> createState() => _CalendarWithArrowsState();
}

class _CalendarWithArrowsState extends State<CalendarWithArrows> {
  @override
  Widget build(BuildContext context) {
    widget.controller.setLanguage(context);
    return Row(
      children: [
        CalendarExactDatePicker(
          onDatePicked: _onDatePicked,
          controller: DatePickerController(widget.controller.firstDate,
              widget.controller.lastDate, widget.controller.pickedDate),
        ),
        CalendarMoveBackward(
          onPressed: _onBackwardPressed,
        ),
        Expanded(
          child: Text(
            widget.controller.getPickedDateStringRepresentationForAppBar(),
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
    DateTime date = widget.controller.pickedDate;
    widget.controller.subtractOneDayFromPickedDateIfPossible();
    _notifyAboutDateChangedIfItChanged(date);
    setState(() {});
  }

  void _onForwardPressed() {
    DateTime date = widget.controller.pickedDate;
    widget.controller.addOneDayFromPickedDateIfPossible();
    _notifyAboutDateChangedIfItChanged(date);
    setState(() {});
  }

  void _onDatePicked(DateTime value) {
    DateTime date = widget.controller.pickedDate;
    widget.controller.pickedDate = value;
    _notifyAboutDateChangedIfItChanged(date);
    setState(() {});
  }

  void _notifyAboutDateChangedIfItChanged(DateTime previousDate) {
    if (previousDate != widget.controller.pickedDate) {
      widget.onDateChanged(widget.controller.pickedDate);
    }
  }
}
