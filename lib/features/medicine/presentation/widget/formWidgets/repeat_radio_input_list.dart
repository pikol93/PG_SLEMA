import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/presentation/controller/add_medicine_controller.dart';
import 'package:pg_slema/features/medicine/presentation/entity/medicine.dart';

class CustomDropdownMedicineInput extends StatefulWidget {
  final AddMedicineController controller;

  const CustomDropdownMedicineInput({
    super.key,
    required this.controller,
  });

  @override
  State<CustomDropdownMedicineInput> createState() =>
      _CustomDropdownMedicineInputState();
}

class _CustomDropdownMedicineInputState
    extends State<CustomDropdownMedicineInput> {
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
      items: Medicine.repeatTextList.map((String title) {
        return DropdownMenuItem(
          value: MedicineRepeat.values
              .elementAt(Medicine.repeatTextList.indexOf(title)
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
