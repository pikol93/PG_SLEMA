import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/medicine/presentation/controller/add_medicine_controller.dart';
import 'package:pg_slema/features/medicine/presentation/controller/date_picker_controller.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/custom_date_picker.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/frequency_list.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/save_button.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/text_input.dart';
import 'package:pg_slema/features/notification/presentation/widget/manage_notifications_widget.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';

class EditMedicineScreen extends StatefulWidget {
  final ValueSetter<Medicine> onMedicineChanged;
  final AddMedicineController controller = AddMedicineController();
  EditMedicineScreen(
      {super.key,
      required this.onMedicineChanged,
      required Medicine medicine}) {
    controller.initFromMedicine(medicine);
  }

  @override
  State<EditMedicineScreen> createState() => _EditMedicineScreen();
}

class _EditMedicineScreen extends State<EditMedicineScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    widget.controller.dispose();
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  label: "Nazwa",
                  icon: Icons.create,
                  initialValue: widget.controller.typedMedicineName,
                  onChanged: (value) =>
                      widget.controller.typedMedicineName = value,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  label: "Sposób aplikacji leku",
                  icon: Icons.create,
                  initialValue: widget.controller.typedIntakeType,
                  onChanged: (value) =>
                      widget.controller.typedIntakeType = value,
                ),
                const SizedBox(height: 20),
                FrequencyList(
                    initialValue: widget.controller.frequency,
                    onChanged: (frequency) =>
                        _handleFrequencyChange(frequency)),
                const SizedBox(height: 20),
                _createDataFieldIfPossible(),
                ManageNotificationsWidget(
                  controller: widget.controller,
                ),
                const SizedBox(height: 20),
                CustomSaveButton(
                    controller: widget.controller,
                    formKey: _formKey,
                    onAddedMedicine: () => widget.controller
                        .createMedicine()
                        .then(widget.onMedicineChanged)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleFrequencyChange(Frequency frequency) {
    widget.controller.frequency = frequency;
    setState(() {
      widget.controller.canDateBePicked =
          frequency == Frequency.singular ? false : true;
    });
  }

  Widget _createDataFieldIfPossible() {
    return Column(
      children: [
        if (widget.controller.canDateBePicked) ...[
          CustomDatePicker(
              onDateSelected: (date) => widget.controller.endIntakeDate = date,
              controller: DatePickerController(
                  DateTime.now().add(const Duration(days: 1)),
                  DateTime.now().add(const Duration(days: 365)),
                  createInitialDateTime()),
              label: "Data zakończenia przyjmowania"),
          const SizedBox(height: 20),
        ]
      ],
    );
  }

  DateTime createInitialDateTime() {
    return widget.controller.endIntakeDate
                .compareTo(DateTime.now().add(const Duration(days: 1))) >
            -1
        ? widget.controller.endIntakeDate
        : DateTime.now().add(const Duration(days: 1));
  }
}
