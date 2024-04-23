import 'package:flutter/material.dart';

class TimeOfDayPicker extends StatefulWidget {
  final ValueChanged<TimeOfDay> onTimeSelected;

  final TimeOfDay? initialValue;

  const TimeOfDayPicker({
    super.key,
    required this.onTimeSelected,
    this.initialValue,
  });

  @override
  State<TimeOfDayPicker> createState() => _TimeOfDayPickerState();
}

class _TimeOfDayPickerState extends State<TimeOfDayPicker> {
  late TimeOfDay _selectedTime;

  @override
  void initState() {
    super.initState();
    final initialValue = widget.initialValue ?? TimeOfDay.now();
    _selectedTime = initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final selectedTime = await showTimePicker(
          context: context,
          initialTime: _selectedTime,
        );

        if (selectedTime != null) {
          widget.onTimeSelected(selectedTime);
          setState(() {
            _selectedTime = selectedTime;
          });
        }
      },
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: "Godzina ćwiczenia",
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedTime.format(context),
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
