import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
import 'package:pg_slema/features/medicine/presentation/controller/add_medicine_controller.dart';
import 'package:pg_slema/features/medicine/presentation/controller/date_picker_controller.dart';
import 'package:pg_slema/utils/widgets/date_picker/date_picker.dart';
import 'package:pg_slema/features/medicine/presentation/widget/form_widgets/frequency_list.dart';
import 'package:pg_slema/utils/widgets/forms/save_button.dart';
import 'package:pg_slema/utils/widgets/forms/text_input.dart';
import 'package:pg_slema/features/notification/presentation/widget/manage_notifications_widget.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';
import 'package:pg_slema/features/medicine/presentation/widget/form_widgets/notification_manager.dart';
import 'package:pg_slema/utils/widgets/default_appbar/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

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
  final double _mainPaddingBetweenInputs = 15.0;
  final double _singleWidgetInRowPadding = 3.0;

  @override
  void initState() {
    super.initState();
    _controller.initFromMedicine(widget.medicine);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DefaultAppBar(title: "Edytuj lekarstwo"),
        DefaultBody(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: _mainPaddingBetweenInputs),
                  CustomTextFormField(
                    label: "Nazwa",
                    icon: null,
                    onChanged: (value) => _controller.typedMedicineName = value,
                    initialValue: _controller.typedMedicineName,
                  ),
                  SizedBox(height: _mainPaddingBetweenInputs),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.only(right: _singleWidgetInRowPadding),
                          child: CustomTextFormField(
                            label: "Dawka",
                            icon: Icons.vaccines,
                            onChanged: (value) => _controller.typedDose = value,
                            isValueRequired: false,
                            initialValue: _controller.typedDose,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: _singleWidgetInRowPadding),
                          child: CustomTextFormField(
                            label: "Rodzaj",
                            icon: Icons.medication_outlined,
                            onChanged: (value) =>
                                _controller.typedMedicineType = value,
                            isValueRequired: false,
                            initialValue: _controller.typedMedicineType,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: _mainPaddingBetweenInputs),
                  CustomTextFormField(
                    label: "Jak używać",
                    icon: Icons.water_drop_outlined,
                    onChanged: (value) => _controller.typedIntakeType = value,
                    isValueRequired: false,
                    initialValue: _controller.typedIntakeType,
                  ),
                  SizedBox(height: 2 * _mainPaddingBetweenInputs),
                  NotificationManager(
                    switchValue: _controller.canNotificationsBePicked,
                    onChanged: changeNotificationsAvailable,
                  ),
                  SizedBox(height: 2 * _mainPaddingBetweenInputs),
                  if (_controller.canNotificationsBePicked) ...[
                    FrequencyList(
                      initialValue: _controller.frequency,
                      onChanged: (frequency) =>
                          _handleFrequencyChange(frequency),
                    ),
                    SizedBox(height: _mainPaddingBetweenInputs),
                    _createIntakeDataFieldIfPossible(),
                    ManageNotificationsTimeWidget(
                      controller: _controller,
                    ),
                    SizedBox(height: _mainPaddingBetweenInputs),
                  ],
                  CustomSaveButton(
                      formKey: _formKey,
                      onSaved: () => _controller
                          .createMedicine()
                          .then(widget.onMedicineChanged)),
                  SizedBox(height: _mainPaddingBetweenInputs),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void changeNotificationsAvailable(newValue) {
    setState(() {
      _controller.canNotificationsBePicked = newValue;
    });
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
          DatePicker(
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
