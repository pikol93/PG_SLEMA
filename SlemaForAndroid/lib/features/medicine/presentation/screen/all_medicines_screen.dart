import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
import 'package:pg_slema/features/medicine/presentation/controller/medicine_screen_controller.dart';
import 'package:pg_slema/features/medicine/presentation/widget/all_medicines_screen/single_medicine_widget.dart';
import 'package:pg_slema/utils/widgets/appbars/white_app_bar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body_with_floating_action_button.dart';
import 'package:pg_slema/utils/widgets/default_floating_action_button/default_floating_action_button.dart';
import 'package:pg_slema/features/medicine/presentation/screen/add_medicine_screen.dart';

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

  void openAddingMedicinesScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AddMedicineScreen(onMedicineAdded: onMedicineCreated),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WhiteAppBar(titleText: "Lekarstwa"),
        DefaultBodyWithFloatingActionButton(
          onFloatingButtonPressed: openAddingMedicinesScreen,
          child: ListView.builder(
            itemCount: _controller.medicines.length,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return SingleMedicineWidget(
                medicine: _controller.medicines[index],
                onMedicineDeleted: onMedicineDeleted,
                onMedicineEdited: onMedicineEdited,
              ).build(context);
            },
          ),
        ),
      ],
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
