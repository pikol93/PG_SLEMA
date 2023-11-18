import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/presentation/controller/add_medicine_controller.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/date_input.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/repeat_radio_input_list.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/save_button.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/text_input.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/time_input.dart';

import 'formWidgets/type_radio_input.dart';

class AddMedicineScreen extends StatefulWidget {

  final VoidCallback onAddedMedicine;
  const AddMedicineScreen({super.key, required this.onAddedMedicine});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _controller = AddMedicineController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dodaj lek"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(label: "Nazwa", icon: Icons.create, controller: _controller,),
                const SizedBox(height: 10),
                MedicineTypeSelection(controller: _controller,),
                const SizedBox(height: 20),
                CustomDatePicker(controller: _controller, label: "Data przyjęcia leku"),
                const SizedBox(height: 20),
                CustomTimePicker(controller: _controller, label: "Godzina przyjęcia leku",),
                const SizedBox(height: 20),
                CustomDropdownMedicineInput(controller: _controller,),
                const SizedBox(height: 20),
                CustomSaveButton(controller: _controller, formKey: _formKey, onAddedMedicine: widget.onAddedMedicine,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
