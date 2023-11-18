import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/presentation/controller/add_medicine_controller.dart';

class CustomDatePicker extends StatefulWidget {
  final AddMedicineController controller;
  final String label;

  const CustomDatePicker({
    super.key,
    required this.controller,
    required this.label,
  });

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
          initialDate: widget.controller.todayDate,
          firstDate: widget.controller.allowedFirstDate,
          lastDate: widget.controller.allowedLastDate,
          helpText: "Wybierz datę przyjęcia leku",
          fieldLabelText: "Wpisz swoją datę przyjęcia leku",
          errorFormatText: "Zły format daty!",
        );

        if (selectedDate != null &&
            selectedDate != widget.controller.pickedMedicineIntakeDate) {
          // calling setState notifies widget that the state has changed,
          // so the widget can update
          setState(() {
            widget.controller.pickedMedicineIntakeDate = selectedDate;
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
            Text(AddMedicineController.dateTimeToString(
                widget.controller.pickedMedicineIntakeDate)),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
