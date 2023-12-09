import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/presentation/controller/add_medicine_controller.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/save_button.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/text_input.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  label: "Nazwa",
                  icon: Icons.create,
                  onChanged: (value) => _controller.pickedMedicineName = value,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  label: "Sposób aplikacji leku",
                  icon: Icons.create,
                  onChanged: (value) => _controller.typedIntakeType = value,
                ),
                //TODO notyfikacje!!
                const SizedBox(height: 20),
                CustomSaveButton(
                  controller: _controller,
                  formKey: _formKey,
                  onAddedMedicine: widget.onAddedMedicine,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
