import 'package:flutter/material.dart';

import 'add_medicine_screen.dart';

class AddMedicineButton extends StatelessWidget {
  const AddMedicineButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => const AddMedicineScreen(),
              ));},
      child: const Icon(Icons.add),
    );
  }
}