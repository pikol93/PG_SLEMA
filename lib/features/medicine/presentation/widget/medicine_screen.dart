import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/presentation/controller/medicine_screen_controller.dart';
import 'package:pg_slema/features/medicine/presentation/widget/add_medicine_button.dart';
import 'package:pg_slema/features/medicine/presentation/widget/medicine_widget.dart';

class MedicineScreen extends StatefulWidget {
  final MedicineScreenController controller = MedicineScreenController();

  MedicineScreen({super.key}) {
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
                      return MedicineWidget(
                              medicine: widget.controller.medicines[index])
                          .build(context);
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
          AddMedicineButton(onAddedMedicine: refreshMedicinesData),
    );
  }
}
