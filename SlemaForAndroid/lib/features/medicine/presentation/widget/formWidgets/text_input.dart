import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final ValueChanged<String> onChanged;

  const CustomTextFormField(
      {super.key,
      required this.label,
      required this.icon,
      required this.onChanged,
      this.initialValue});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Proszę uzupełnić to pole';
        }
        return null;
      },
      onChanged: (value) {
        widget.onChanged(value);
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
