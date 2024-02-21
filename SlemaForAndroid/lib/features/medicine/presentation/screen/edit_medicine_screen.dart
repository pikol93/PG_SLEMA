import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
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
  final Medicine medicine;
  const EditMedicineScreen(
      {super.key, required this.onMedicineChanged, required this.medicine});

  @override
  State<EditMedicineScreen> createState() => _EditMedicineScreen();
}

class _EditMedicineScreen extends State<EditMedicineScreen> {
  final _controller = AddMedicineController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller.initFromMedicine(widget.medicine);
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
                  initialValue: _controller.typedMedicineName,
                  onChanged: (value) => _controller.typedMedicineName = value,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  label: "Sposób aplikacji leku",
                  icon: Icons.create,
                  initialValue: _controller.typedIntakeType,
                  onChanged: (value) => _controller.typedIntakeType = value,
                ),
                const SizedBox(height: 20),
                FrequencyList(
                    initialValue: _controller.frequency,
                    onChanged: (frequency) =>
                        _handleFrequencyChange(frequency)),
                const SizedBox(height: 20),
                _createDataFieldIfPossible(),
                ManageNotificationsWidget(
                  controller: _controller,
                ),
                const SizedBox(height: 20),
                CustomSaveButton(
                    controller: _controller,
                    formKey: _formKey,
                    onAddedMedicine: () => _controller
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
    _controller.frequency = frequency;
    setState(() {
      _controller.canDateBePicked =
          frequency == Frequency.singular ? false : true;
    });
  }

  Widget _createDataFieldIfPossible() {
    return Column(
      children: [
        if (_controller.canDateBePicked) ...[
          CustomDatePicker(
              onDateSelected: (date) => _controller.endIntakeDate = date,
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
    return _controller.endIntakeDate
                .compareTo(DateTime.now().add(const Duration(days: 1))) >
            -1
        ? _controller.endIntakeDate
        : DateTime.now().add(const Duration(days: 1));
  }
}
