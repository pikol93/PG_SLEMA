import 'package:flutter/material.dart';
import 'package:pg_slema/features/notification/presentation/controller/time_picker_controller.dart';

class CustomTimePicker extends StatefulWidget {
  final ValueChanged<TimeOfDay> onTimeChanged;
  final TimePickerController controller;

  final String? label;

  const CustomTimePicker(
      {super.key,
      this.label,
      required this.onTimeChanged,
      required this.controller});

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  Future<void> _onTap() async {
    final selectedTime = await showTimePicker(
      context: context,
      initialTime: widget.controller.selectedTime,
    );
    if (selectedTime != null) {
      setState(() {
        widget.controller.selectedTime = selectedTime;
      });
      widget.onTimeChanged(selectedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.label,
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.schedule),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.controller.selectedTime.format(context)),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
