import 'package:flutter/material.dart';

import '../../controller/add_medicine_controller.dart';

class CustomTimePicker extends StatefulWidget {
  final AddMedicineController controller;

  final String label;

  const CustomTimePicker({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final selectedTime = await showTimePicker(
          context: context,
          initialTime: widget.controller.todayTime,
        );

        if (selectedTime != null &&
            selectedTime!=widget.controller.pickedMedicineIntakeTime) {
          // calling setState notifies widget that the state has changed,
          // so the widget can update
          setState(() {
            widget.controller.pickedMedicineIntakeTime = selectedTime;
          });
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.label,
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.schedule),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.controller.pickedMedicineIntakeTime!.format(context)),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}