import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/presentation/controller/add_medicine_controller.dart';
import 'package:pg_slema/features/medicine/presentation/controller/date_picker_controller.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/custom_date_picker.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/frequency_list.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/save_button.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/text_input.dart';
import 'package:pg_slema/features/notification/presentation/widget/manage_notifications_widget.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';

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
                  onChanged: (value) => _controller.typedMedicineName = value,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  label: "Sposób aplikacji leku",
                  icon: Icons.create,
                  onChanged: (value) => _controller.typedIntakeType = value,
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    if (_controller.canDateBePicked) ...[
                      CustomDatePicker(
                          onDateSelected: (date) =>
                              _controller.endIntakeDate = date,
                          controller: DatePickerController(
                              DateTime.now().add(const Duration(days: 1)),
                              DateTime.now().add(const Duration(days: 365)),
                              DateTime.now().add(const Duration(days: 1))),
                          label: "Data zakończenia przyjmowania"),
                      const SizedBox(height: 20),
                    ]
                  ],
                ),
                FrequencyList(
                    initialValue: _controller.frequency,
                    onChanged: (frequency) =>
                        _handleFrequencyChange(frequency)),
                const SizedBox(height: 20),
                ManageNotificationsWidget(
                    onNotificationChanged: _controller.onNotificationChanged,
                    onNotificationDeleted: _controller.onNotificationDeleted,
                    onNotificationCreated: _controller.onNotificationCreated),
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

  void _handleFrequencyChange(Frequency frequency) {
    _controller.frequency = frequency;
    setState(() {
      _controller.canDateBePicked =
          frequency == Frequency.singular ? false : true;
    });
  }
}
