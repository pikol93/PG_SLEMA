
import 'package:flutter/material.dart';
import 'add_medicine.dart';
import 'medicine_calendar.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AddMedicineButton(onPressed: () {
        //TODO Stworzyc kontroler i dodac tutaj obsluge tworzenia leku
      }),
    );
  }
}