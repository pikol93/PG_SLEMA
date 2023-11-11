
import 'package:flutter/material.dart';
import 'add_medicine.dart';
import 'medicine_calendar.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [
          MedicineCalendar(),
          SizedBox(height: 20.0),
          Center(
            child: Text("Medicine screen"),
          ),
        ],
      ),
      floatingActionButton: AddMedicineButton(onPressed: () {
        //TODO Stworzyc kontroler i dodac tutaj obsluge tworzenia leku
      }),
    );
  }
}