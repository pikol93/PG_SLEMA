import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/medicine/presentation/widget/add_medicine_screen.dart';

class AddMedicineButton extends StatelessWidget {
  final ValueSetter<Medicine> onAddedMedicine;
  const AddMedicineButton({super.key, required this.onAddedMedicine});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMedicineScreen(
                onAddedMedicine: onAddedMedicine,
              ),
            ));
      },
      child: const Icon(Icons.add),
    );
  }
}
