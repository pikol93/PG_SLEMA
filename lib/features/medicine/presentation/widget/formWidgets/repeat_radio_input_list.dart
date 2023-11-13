import 'package:flutter/material.dart';

import '../../controller/add_medicine_controller.dart';
import '../../entity/medicine.dart';


class CustomDropdownMedicineInput extends StatefulWidget {
  final AddMedicineController controller;

  final List<String> optionsTitles = ["Nie potwarza się", "Codziennie", "Co dwa dni", "Co tydzień"];

  CustomDropdownMedicineInput({
    super.key,
    required this.controller,
  });

  @override
  State<CustomDropdownMedicineInput> createState() => _CustomDropdownMedicineInputState();
}

class _CustomDropdownMedicineInputState extends State<CustomDropdownMedicineInput> {

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget.controller.pickedMedicineRepeat,
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          widget.controller.pickedMedicineRepeat = value as MedicineRepeat;
        });
      },
      onSaved: (value) {
        setState(() {
          widget.controller.pickedMedicineRepeat = value as MedicineRepeat;
        });
      },
      items: widget.optionsTitles.map((String title) {
        return DropdownMenuItem(
          value: MedicineRepeat.values.elementAt(
            widget.optionsTitles.indexOf(title)
                //option title index = option enum index
          ),
          child: Text(title),
        );
      }).toList(),
      decoration: const InputDecoration(
        labelText: "Powtarzanie",
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.refresh),
      ),
    );
  }
}