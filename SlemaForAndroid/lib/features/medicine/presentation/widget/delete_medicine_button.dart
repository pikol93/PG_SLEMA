import 'package:flutter/material.dart';

class DeleteMedicineButton extends StatelessWidget {
  final VoidCallback onPressed;
  const DeleteMedicineButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
          backgroundColor: Theme.of(context).primaryColor),
      child: const Icon(Icons.delete, color: Colors.white),
    );
  }
}
