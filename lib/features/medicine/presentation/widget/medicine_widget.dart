import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';

class MedicineWidget extends StatelessWidget {
  final Medicine medicine;

  const MedicineWidget({super.key, required this.medicine});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            medicine.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            '${Medicine.getRepeatToText(medicine.repeat)} - ${medicine.intakeTime.hour}:${medicine.intakeTime.minute.toString().padLeft(2, '0')}',
          ),
        ],
      ),
    );
  }
}
