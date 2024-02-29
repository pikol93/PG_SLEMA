import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
import 'package:pg_slema/features/medicine/presentation/controller/add_medicine_controller.dart';
import 'package:pg_slema/features/medicine/presentation/controller/date_picker_controller.dart';
import 'package:pg_slema/features/medicine/presentation/widget/form_widgets/custom_date_picker.dart';
import 'package:pg_slema/features/medicine/presentation/widget/form_widgets/save_button.dart';
import 'package:pg_slema/features/medicine/presentation/widget/form_widgets/text_input.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/features/notification/presentation/widget/manage_notifications_widget.dart';
import 'package:pg_slema/features/medicine/presentation/widget/form_widgets/frequency_list.dart';
import 'package:pg_slema/features/medicine/presentation/widget/add_medicine_screen_app_bar.dart';
import 'package:pg_slema/features/medicine/presentation/widget/form_widgets/notification_manager.dart';

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
  bool notificationsAvailable = false;
  void changeNotificationsAvailable(newValue) {
    setState(() {
      notificationsAvailable = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AddMedicineScreenAppBar(),
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
                          label: "Dawka",
                          icon: Icons.vaccines,
                          onChanged: (value) => _controller.typedDose = value,
                          isValueRequired: false,
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
                          label: "Rodzaj",
                          icon: Icons.medication_outlined,
                          onChanged: (value) =>
                              _controller.typedMedicineType = value,
                          isValueRequired: false,
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
                    isValueRequired: false,
                  ),
                ),
                SizedBox(height: 2 * _mainPaddingBetweenInputs),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: _mainWidgetsPaddingHorizontal),
                  child: NotificationManager(
                    switchValue: notificationsAvailable,
                    onChanged: changeNotificationsAvailable,
                  ),
                ),
                SizedBox(height: 2 * _mainPaddingBetweenInputs),
                if (notificationsAvailable) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: _mainWidgetsPaddingHorizontal),
                    child: FrequencyList(
                      initialValue: _controller.frequency,
                      onChanged: (frequency) =>
                          _handleFrequencyChange(frequency),
                    ),
                  ),
                  SizedBox(height: _mainPaddingBetweenInputs),
                  _createIntakeDataFieldIfPossible(),
                  ManageNotificationsWidget(
                    controller: _controller,
                  ),
                  SizedBox(height: _mainPaddingBetweenInputs),
                ],
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
    _controller.onFrequencyChanged(frequency);
    setState(() {
      _controller.updatePermissionForDatePicking();
    });
  }

  Widget _createIntakeDataFieldIfPossible() {
    return Column(
      children: [
        if (_controller.canDateBePicked) ...[
          CustomDatePicker(
              onDateSelected: (date) => _controller.intakeDate = date,
              controller: DatePickerController(
                  DateTime.now(),
                  DateTime.now().add(const Duration(days: 365)),
                  DateTime.now()),
              label: "Data przyjęcia"),
          const SizedBox(height: 20),
        ]
      ],
    );
  }
}
