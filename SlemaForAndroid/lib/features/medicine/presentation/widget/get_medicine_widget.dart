import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';

class GetMedicineWidget extends StatelessWidget {
  final ValueChanged<Medicine> onDeleteClicked;
  final Medicine medicine;

  const GetMedicineWidget(
      {super.key, required this.medicine, required this.onDeleteClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Theme.of(context).primaryColorLight,
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
          Text(
            medicine.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            medicine.intakeType,
          ),
          const SizedBox(height: 12.0),
          FilledButton(
            onPressed: () => onDeleteClicked(medicine),
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(0),
                backgroundColor: Theme.of(context).primaryColor),
            child: const Icon(Icons.delete, color: Colors.white),
          )
        ]));
  }
}
