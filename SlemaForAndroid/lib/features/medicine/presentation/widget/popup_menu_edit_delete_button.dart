import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/medicine/presentation/widget/edit_medicine_screen.dart';

class PopupMenuEditDeleteButton extends StatelessWidget {
  final VoidCallback onPressedDelete;
  final ValueChanged<Medicine> onMedicineChanged;
  final ValueGetter<Medicine> medicineProvider;
  const PopupMenuEditDeleteButton(
      {super.key,
      required this.onPressedDelete,
      required this.onMedicineChanged,
      required this.medicineProvider});

  void onPressedEdit(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditMedicineScreen(
            onMedicineChanged: onMedicineChanged,
            medicine: medicineProvider(),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<void Function()>(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: () {
              onPressedEdit(context);
            },
            child: Text(
              'Edytuj',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          PopupMenuItem(
            value: onPressedDelete,
            child: Text('Usuń',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.error)),
          ),
        ];
      },
      onSelected: (fn) => fn(),
    );
  }
}
