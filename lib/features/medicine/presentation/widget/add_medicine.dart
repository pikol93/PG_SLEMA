import 'package:flutter/material.dart';

class AddMedicineButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddMedicineButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}