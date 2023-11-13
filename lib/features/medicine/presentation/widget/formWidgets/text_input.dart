import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/presentation/controller/add_medicine_controller.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final IconData icon;
  final AddMedicineController controller;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Proszę uzupełnić to pole';
        }
        return null;
      },
      onChanged: (value) {
        widget.controller.pickedMedicineName = value;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: widget.label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(widget.icon),
      ),
    );
  }
}