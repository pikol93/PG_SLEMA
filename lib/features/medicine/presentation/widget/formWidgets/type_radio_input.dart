import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/presentation/controller/add_medicine_controller.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';

class MedicineTypeSelection extends StatefulWidget {
  final AddMedicineController controller;
  final List<String> optionsTitles = ["Tabletka", "Ciecz", "Inne"];
  MedicineTypeSelection({super.key, required this.controller});

  @override
  State<MedicineTypeSelection> createState() => _MedicineTypeSelectionState();
}

class _MedicineTypeSelectionState extends State<MedicineTypeSelection> {
  //TODO: Zmiana tego widgetu, jest brzydko i się nie skaluje
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.optionsTitles.length,
        (index) => Flexible(
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            title: Transform.translate(
              offset: const Offset(-15, 0),
              child: Text(widget.optionsTitles[index]),
            ),
            value: MedicineType.values[index],
            groupValue: widget.controller.pickedMedicineType,
            onChanged: (value) {
              setState(() {
                widget.controller.pickedMedicineType = value as MedicineType;
              });
            },
          ),
        ),
      ),
    );
  }
}
