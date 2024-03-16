import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
import 'package:pg_slema/features/medicine/presentation/widget/all_medicines_screen/single_medicine_label.dart';
import 'package:pg_slema/features/medicine/presentation/widget/all_medicines_screen/popup_menu_edit_delete_button.dart';
import 'package:pg_slema/utils/widgets/default_container/default_container.dart';

class SingleMedicineWidget extends StatelessWidget {
  final ValueChanged<Medicine> onMedicineDeleted;
  final ValueChanged<Medicine> onMedicineEdited;
  final Medicine medicine;

  const SingleMedicineWidget(
      {super.key,
      required this.medicine,
      required this.onMedicineDeleted,
      required this.onMedicineEdited});

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      padding: const EdgeInsets.all(15),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
              child: Icon(
                Icons.medication_outlined,
                color: Theme.of(context).primaryColor,
                size: 32,
              ),
            ),
            Expanded(
              child: Text(
                medicine.name,
                style: Theme.of(context).textTheme.headlineLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            PopupMenuEditDeleteButton(
                onMedicineChanged: onMedicineEdited,
                medicineProvider: () => medicine,
                onDeletePressed: () => onMedicineDeleted(medicine)),
          ],
        ),
        Wrap(
          runSpacing: 5.0,
          spacing: 5.0,
          children: [
            if (medicine.dose.isNotEmpty)
              SingleMedicineLabel(
                label: medicine.dose,
                color: const Color(0xFFB6DDFA),
              ),
            if (medicine.medicineType.isNotEmpty)
              SingleMedicineLabel(
                label: medicine.medicineType,
                color: const Color(0xFFFAB6B6),
              ),
            if (medicine.intakeType.isNotEmpty)
              SingleMedicineLabel(
                label: medicine.intakeType,
                color: const Color(0xFFB6FAB6),
              ),
          ],
        )
      ]),
    );
  }
}
