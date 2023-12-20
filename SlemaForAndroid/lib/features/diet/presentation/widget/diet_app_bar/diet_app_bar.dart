import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/controller/calendar_controller.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/calendar_functionality_widgets/calendar_exact_date_picker.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/calendar_functionality_widgets/calendar_move_backward.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/calendar_functionality_widgets/calendar_move_forward.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/meal_idea_icon_button.dart';

class DietAppBar extends StatefulWidget {
  final CalendarController exactDatePickerController = CalendarController();
  DietAppBar({super.key});

  @override
  State<DietAppBar> createState() => _DietAppBarState();
}

class _DietAppBarState extends State<DietAppBar>
    with AutomaticKeepAliveClientMixin {
  String appBarDateText = "Dzisiaj";
  void updatePickedDateStringRepresentation(String value) {
    setState(() {
      appBarDateText = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(15, 10),
        ),
      ),
      elevation: 5,
      toolbarHeight: 100,
      title: Row(
        children: [
          CalendarExactDatePicker(
            onPickedDate: updatePickedDateStringRepresentation,
            controller: widget.exactDatePickerController,
          ),
          CalendarMoveBackward(
            onPickedDate: updatePickedDateStringRepresentation,
            controller: widget.exactDatePickerController,
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
            onPickedDate: updatePickedDateStringRepresentation,
            controller: widget.exactDatePickerController,
          ),
          const MealIdeaIconButton(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
