import 'package:flutter/material.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/calendar_with_arrows.dart';
import 'package:pg_slema/features/diet/presentation/widget/diet_app_bar/meal_idea_icon_button.dart';

class DietAppBar extends StatefulWidget {
  final ValueChanged<DateTime> onDateChanged;

  const DietAppBar({super.key, required this.onDateChanged});

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
            Expanded(
                child: CalendarWithArrows(onDateChanged: widget.onDateChanged)),
            const MealIdeaIconButton()
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
