import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/medicine/presentation/widget/edit_medicine_screen.dart';

class EditMedicineButton extends StatelessWidget {
  final ValueChanged<Medicine> onMedicineChanged;
  final ValueGetter<Medicine> medicineProvider;
  const EditMedicineButton(
      {super.key,
      required this.onMedicineChanged,
      required this.medicineProvider});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => onPressed(context),
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0),
          backgroundColor: Theme.of(context).primaryColor),
      child: const Icon(Icons.edit),
    );
  }

  void onPressed(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditMedicineScreen(
            onMedicineChanged: onMedicineChanged,
            medicine: medicineProvider(),
          ),
        ));
  }
}
