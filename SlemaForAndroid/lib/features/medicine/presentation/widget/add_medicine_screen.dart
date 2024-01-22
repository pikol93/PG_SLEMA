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

class AddMedicineScreen extends StatefulWidget {
  final ValueSetter<Medicine> onMedicineAdded;
  const AddMedicineScreen({super.key, required this.onMedicineAdded});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _controller = AddMedicineController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 170,
        automaticallyImplyLeading: false,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_rounded)),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              child: Text("Dodaj"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              child: Text("lekarstwo"),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/medicine/add_medicine_appbar_background.png'),
                fit: BoxFit.fill),
          ),
        ),
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
                  onChanged: (value) => _controller.typedMedicineName = value,
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  label: "Sposób aplikacji leku",
                  icon: Icons.create,
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
                        .then(widget.onMedicineAdded)),
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
      _controller.checkIfDateCanBePicked();
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
                  DateTime.now().add(const Duration(days: 1))),
              label: "Data zakończenia przyjmowania"),
          const SizedBox(height: 20),
        ]
      ],
    );
  }
}
