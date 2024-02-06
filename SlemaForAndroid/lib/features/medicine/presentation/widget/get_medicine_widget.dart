import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
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
        margin: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: const Color(0xFFE7ECEF), //TODO
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000), //TODO
              offset: Offset(0.0, 4.0),
              blurRadius: 4.0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
                child: Icon(
                  Icons.medication_outlined,
                  color: Color(0xFF487ABC), //TODO
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
                  onPressedDelete: () => onMedicineDeleted(medicine)),
            ],
          ),
          Card(
            elevation: 4.0,
            color: Colors.blueAccent,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 15.0),
              child: Text(
                medicine.intakeType,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: Colors.white70),
              ),
            ),
          ),
        ]));
  }
}
