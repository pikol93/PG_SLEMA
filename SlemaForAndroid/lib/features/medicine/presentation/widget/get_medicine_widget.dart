import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/medicine/presentation/widget/delete_medicine_button.dart';
import 'package:pg_slema/features/medicine/presentation/widget/edit_medicine_button.dart';
import 'package:pg_slema/features/medicine/presentation/widget/popup_menu_edit_delete_button.dart';

class GetMedicineWidget extends StatelessWidget {
  final ValueChanged<Medicine> onMedicineDeleted;
  final ValueChanged<Medicine> onMedicineEdited;
  final Medicine medicine;

  const GetMedicineWidget(
      {super.key,
      required this.medicine,
      required this.onMedicineDeleted,
      required this.onMedicineEdited});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: const Color(0xFFE7ECEF), //TODO
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 4.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                onPressedDelete: () => onMedicineDeleted(medicine)),
          ]),
          const SizedBox(height: 12.0),
          Text(
            medicine.intakeType,
          ),
          const SizedBox(height: 12.0),
        ]));
  }
}
