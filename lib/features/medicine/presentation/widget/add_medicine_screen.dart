import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/presentation/controller/add_medicine_controller.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/date_input.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/repeat_radio_input_list.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/text_input.dart';
import 'package:pg_slema/features/medicine/presentation/widget/formWidgets/time_input.dart';

import 'formWidgets/type_radio_input.dart';

class AddMedicineScreen extends StatefulWidget {

  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _controller = AddMedicineController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dodaj lek"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          child: Column(
            children: [
              const CustomTextFormField(label: "Nazwa", icon: Icons.create,),
              const SizedBox(height: 10),
              TypeSelection(controller: _controller,),
              const SizedBox(height: 20),
              CustomDatePicker(controller: _controller, label: "Data przyjęcia leku"),
              const SizedBox(height: 20),
              CustomTimePicker(controller: _controller, label: "Godzina przyjęcia leku",),
              const SizedBox(height: 20),
              CustomDropdownMedicineInput(controller: _controller,),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                  ),
                  child: const Text(
                    "Zapisz",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
