import 'package:flutter/material.dart';
import 'package:pg_slema/custom_icons_icons.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
import 'package:pg_slema/features/medicine/presentation/screen/add_medicine_screen.dart';

class AddMedicineButton extends StatelessWidget {
  final ValueSetter<Medicine> onMedicineAdded;
  const AddMedicineButton({super.key, required this.onMedicineAdded});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMedicineScreen(
                onMedicineAdded: onMedicineAdded,
              ),
            ));
      },
      child: const Icon(CustomIcons.addSquare),
    );
  }
}
