import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/presentation/controller/date_picker_controller.dart';

class CustomDatePicker extends StatefulWidget {
  final ValueChanged<DateTime> onDateSelected;
  final DatePickerController controller;
  final String label;

  const CustomDatePicker(
      {super.key,
      required this.onDateSelected,
      required this.controller,
      required this.label});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          initialDate: widget.controller.initialDate,
          firstDate: widget.controller.allowedFirstDate,
          lastDate: widget.controller.allowedLastDate,
          helpText: "Wybierz datę przyjęcia leku",
          fieldLabelText: "Wpisz swoją datę przyjęcia leku",
          errorFormatText: "Zły format daty!",
        );

        if (selectedDate != null) {
          widget.onDateSelected(selectedDate);
          setState(() {
            widget.controller.selectedDate = selectedDate;
          });
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: widget.label,
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.calendar_today),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.controller.selectedDate.toString()),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
