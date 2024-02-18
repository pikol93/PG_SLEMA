import 'package:flutter/material.dart';
import 'package:pg_slema/features/meal/logic/entity/meal_time.dart';
import 'package:pg_slema/utils/string/string_casing_extension.dart';

class MealTimeList extends StatefulWidget {
  final ValueChanged<MealTime> onMealTimeChanged;
  final MealTime initialValue;

  const MealTimeList(
      {super.key, required this.onMealTimeChanged, required this.initialValue});

  @override
  State<StatefulWidget> createState() => _MealTimeListState();

  List<DropdownMenuEntry<MealTime>> _createMealTimeEntries() {
    return MealTime.values
        .map((e) => DropdownMenuEntry<MealTime>(
            value: e, label: e.name.toCapitalized()))
        .toList();
  }
}

class _MealTimeListState extends State<MealTimeList> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: widget.initialValue,
      dropdownMenuEntries: widget._createMealTimeEntries(),
      onSelected: (value) {
        widget.onMealTimeChanged(value!);
      },
      label: const Text("Posiłek"),
    );
  }
}
