import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
import 'package:pg_slema/features/medicine/presentation/controller/medicine_screen_controller.dart';
import 'package:pg_slema/features/medicine/presentation/widget/all_medicines_screen/add_medicine_button.dart';
import 'package:pg_slema/features/medicine/presentation/widget/all_medicines_screen/single_medicine_widget.dart';
import 'package:pg_slema/features/medicine/presentation/widget/all_medicines_screen/all_medicines_screen_app_bar.dart';

class AllMedicinesScreen extends StatefulWidget {
  const AllMedicinesScreen({super.key});

  @override
  State<AllMedicinesScreen> createState() => _AllMedicinesScreenState();
}

class _AllMedicinesScreenState extends State<AllMedicinesScreen> {
  late final MedicineScreenController _controller;

  @override
  void initState() {
    _controller = MedicineScreenController(_onMedicinesChanged);
    super.initState();
    _controller.initializeMedicines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AllMedicinesScreenAppBar(),
      body: ListView.builder(
        itemCount: _controller.medicines.length,
        itemBuilder: (BuildContext context, int index) {
          return SingleMedicineWidget(
            medicine: _controller.medicines[index],
            onMedicineDeleted: onMedicineDeleted,
            onMedicineEdited: onMedicineEdited,
          ).build(context);
        },
      ),
      floatingActionButton:
          AddMedicineButton(onMedicineAdded: onMedicineCreated),
    );
  }

  void onMedicineDeleted(Medicine medicine) {
    _controller.deleteMedicine(medicine);
  }

  void onMedicineCreated(Medicine medicine) {
    _controller.addMedicine(medicine);
  }

  void onMedicineEdited(Medicine medicine) {
    _controller.editMedicine(medicine);
  }

  void _onMedicinesChanged() {
    setState(() {});
  }
}
