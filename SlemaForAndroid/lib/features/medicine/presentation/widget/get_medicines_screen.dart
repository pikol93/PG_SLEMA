import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/medicine/presentation/controller/medicine_screen_controller.dart';
import 'package:pg_slema/features/medicine/presentation/widget/add_medicine_button.dart';
import 'package:pg_slema/features/medicine/presentation/widget/get_medicine_widget.dart';

class GetMedicinesScreen extends StatefulWidget {
  final MedicineScreenController controller = MedicineScreenController();

  GetMedicinesScreen({super.key});

  @override
  State<GetMedicinesScreen> createState() => _GetMedicinesScreenState();
}

class _GetMedicinesScreenState extends State<GetMedicinesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [];
        },
        body: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GetMedicineWidget(
                        medicine: widget.controller.medicines[index],
                        onMedicineDeleted: onMedicineDeleted,
                        onMedicineEdited: onMedicineEdited,
                      ).build(context);
                    },
                    childCount: widget.controller.medicines.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton:
          AddMedicineButton(onMedicineAdded: onMedicineCreated),
    );
  }

  void onMedicineDeleted(Medicine medicine) {
    widget.controller.deleteMedicine(medicine);
    setState(() {});
  }

  void onMedicineCreated(Medicine medicine) {
    widget.controller.addMedicine(medicine);
    setState(() {});
  }

  void onMedicineEdited(Medicine medicine) {}
}
