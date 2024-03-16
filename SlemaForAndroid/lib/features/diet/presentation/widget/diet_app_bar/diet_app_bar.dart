import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/calendar_with_arrows.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/meal_idea_icon_button.dart';

class DietAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<DateTime> onDateChanged;
  final DateTime initDate;

  const DietAppBar(
      {super.key, required this.onDateChanged, required this.initDate});

  @override
  State<DietAppBar> createState() => _DietAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _DietAppBarState extends State<DietAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: kToolbarHeight + 10,
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            Expanded(
                child: CalendarWithArrows(
              onDateChanged: widget.onDateChanged,
              initDate: widget.initDate,
            )),
            const MealIdeaIconButton()
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
