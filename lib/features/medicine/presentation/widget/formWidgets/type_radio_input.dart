import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controller/add_medicine_controller.dart';
import '../../entity/medicine.dart';

class TypeSelection extends StatefulWidget {
  final AddMedicineController controller;
  final List<String> optionsTitles = ["Tabletka", "Ciecz", "Inne"];
  TypeSelection({super.key, required this.controller});

  @override
  State<TypeSelection> createState() => _TypeSelectionState();
}

class _TypeSelectionState extends State<TypeSelection> {
  //TODO: Zmiana tego widgetu, jest brzydko i się nie skaluje
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widget.optionsTitles.length, (index) => Flexible(
        child:
          RadioListTile(
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






