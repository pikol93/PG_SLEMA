import 'package:flutter/material.dart';
import '../controller/medicine_screen_controller.dart';
import '../entity/medicine.dart';
import 'add_medicine_button.dart';

class MedicineScreen extends StatefulWidget {
  final MedicineScreenController controller = MedicineScreenController();

  MedicineScreen({Key? key}) : super(key: key) {
    controller.loadMedicinesFromSharedPreferences();
  }

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  void refreshMedicinesData() {
    setState(() {
      widget.controller.loadMedicinesFromSharedPreferences();
    });
  }

  Widget buildMedicineWidget(Medicine medicine, BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // Remove the MedicineCalendar from the headerSliverBuilder
          return [];
        },
        body: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: [
                // Remove the SliverOverlapAbsorber and SliverOverlapInjector as well if not needed
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      return buildMedicineWidget(widget.controller.medicines[index], context);
                    },
                    childCount: widget.controller.medicines.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: AddMedicineButton(onAddedMedicine: refreshMedicinesData),
    );
  }
}
