
import 'package:flutter/material.dart';
import 'add_medicine_button.dart';
import 'medicine_calendar.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          MedicineCalendar(),
          SizedBox(height: 20.0),
          Center(
            child: Text("Medicine screen"),
          ),
        ],
      ),
      floatingActionButton: AddMedicineButton(),
    );
  }
}