import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
import 'package:pg_slema/features/medicine/presentation/controller/add_medicine_controller.dart';
import 'package:pg_slema/features/medicine/presentation/controller/date_picker_controller.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/custom_date_picker.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/save_button.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/text_input.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/features/notification/presentation/widget/manage_notifications_widget.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/frequency_list.dart';

class AddMedicineScreen extends StatefulWidget {
  final ValueSetter<Medicine> onMedicineAdded;
  const AddMedicineScreen({super.key, required this.onMedicineAdded});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> with Logger {
  final _controller = AddMedicineController();
  final _formKey = GlobalKey<FormState>();

  final double _mainWidgetsPaddingHorizontal = 12.0;
  final double _mainPaddingBetweenInputs = 15.0;
  final double _saveButtonAdditionalPaddingHorizontal = 30.0;
  final double _toolbarHeight = 170.0;
  final double _spaceBetweenBackIconAndTitle = 10.0;
  final double _titleHorizontalPadding = 14.0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _toolbarHeight,
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
            SizedBox(height: _spaceBetweenBackIconAndTitle),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: _titleHorizontalPadding),
              child: const Text("Dodaj"),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: _titleHorizontalPadding),
              child: const Text("lekarstwo"),
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
          padding: EdgeInsets.symmetric(
              horizontal: _mainWidgetsPaddingHorizontal, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _mainWidgetsPaddingHorizontal),
                  child: CustomTextFormField(
                    label: "Nazwa",
                    icon: null,
                    onChanged: (value) => _controller.typedMedicineName = value,
                  ),
                ),
                SizedBox(height: _mainPaddingBetweenInputs),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: _mainWidgetsPaddingHorizontal, right: 3.0),
                        child: CustomTextFormField(
                          label: "Dawka TODO",
                          icon: Icons.vaccines,
                          onChanged: (value) =>
                              logger.warning("Not implemented yet - Dawka"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 3.0,
                          right: _mainWidgetsPaddingHorizontal,
                        ),
                        child: CustomTextFormField(
                          label: "Rodzaj TODO",
                          icon: Icons.medication_outlined,
                          onChanged: (value) =>
                              logger.warning("Not implemented yet - Rodzaj"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: _mainPaddingBetweenInputs),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _mainWidgetsPaddingHorizontal),
                  child: CustomTextFormField(
                    label: "Jak używać",
                    icon: Icons.water_drop_outlined,
                    onChanged: (value) => _controller.typedIntakeType = value,
                  ),
                ),
                SizedBox(height: _mainPaddingBetweenInputs),
                FrequencyList(
                    initialValue: _controller.frequency,
                    onChanged: (frequency) =>
                        _handleFrequencyChange(frequency)),
                SizedBox(height: _mainPaddingBetweenInputs),
                _createDataFieldIfPossible(),
                ManageNotificationsWidget(
                  controller: _controller,
                ),
                SizedBox(height: _mainPaddingBetweenInputs),
                Padding(
                  padding: EdgeInsets.only(
                      left: _saveButtonAdditionalPaddingHorizontal,
                      right: _saveButtonAdditionalPaddingHorizontal),
                  child: CustomSaveButton(
                      controller: _controller,
                      formKey: _formKey,
                      onAddedMedicine: () => _controller
                          .createMedicine()
                          .then(widget.onMedicineAdded)),
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
