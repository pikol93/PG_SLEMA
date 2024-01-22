import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/calendar_functionality_widgets/calendar_exact_date_picker.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/calendar_functionality_widgets/calendar_move_backward.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/calendar_functionality_widgets/calendar_move_forward.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<StatefulWidget> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  @override
  Widget build(BuildContext context) {
    return Row(
    children: [
      CalendarExactDatePicker(
        onPickedDate: updatePickedDateStringRepresentation,
      ),
      CalendarMoveBackward(
        onPickedDate: updatePickedDateStringRepresentation,
      ),
      Expanded(
        child: Text(
          appBarDateText,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
      ),
      CalendarMoveForward(
        onPickedDate: _updatePickedDateStringRepresentation,
        controller: widget.exactDatePickerController,
      ),
      //const MealIdeaIconButton(),
    ],
  );
  }

  void _updatePickedDateStringRepresentation(DateTime date) {

  }
}


