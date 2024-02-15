import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/medicine/presentation/controller/medicine_screen_controller.dart';
import 'package:pg_slema/features/medicine/presentation/widget/add_medicine_button.dart';
import 'package:pg_slema/features/medicine/presentation/widget/get_medicine_widget.dart';
import 'package:pg_slema/features/medicine/presentation/widget/get_medicines_screen_app_bar.dart';

class GetMedicinesScreen extends StatefulWidget {
  const GetMedicinesScreen({super.key});

  @override
  State<GetMedicinesScreen> createState() => _GetMedicinesScreenState();
}

class _GetMedicinesScreenState extends State<GetMedicinesScreen> {
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
      appBar: const GetMedicinesScreenAppBar(),
      body: ListView.builder(
        itemCount: _controller.medicines.length,
        itemBuilder: (BuildContext context, int index) {
          return GetMedicineWidget(
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
