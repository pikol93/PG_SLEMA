import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/presentation/controller/add_medicine_controller.dart';

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
              TextFormField(
                keyboardType: TextInputType.text,
                //controller: ,
                //validator: ,
                decoration: const InputDecoration(
                  labelText: "Nazwa",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.create)
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: _controller.todayDate,
                    firstDate: _controller.allowedFirstDate,
                    lastDate: _controller.allowedLastDate,
                    helpText: "Wybierz datę przyjęcia leku",
                    fieldLabelText: "Wpisz swoją datę przyjęcia leku",
                    errorFormatText: "Zły format daty!",
                  );

                  if (selectedDate != null &&
                      selectedDate!=_controller.pickedMedicineIntakeDate) {
                    // calling setState notifies widget that the state has changed,
                    // so the widget can update
                    setState(() {
                      _controller.pickedMedicineIntakeDate = selectedDate;
                    });
                  }
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: "Data przyjęcia leku",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_controller.dateTimeToString(_controller.pickedMedicineIntakeDate)),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  final selectedTime = await showTimePicker(
                      context: context,
                      initialTime: _controller.todayTime,
                  );

                  if (selectedTime != null &&
                      selectedTime!=_controller.pickedMedicineIntakeTime) {
                    // calling setState notifies widget that the state has changed,
                    // so the widget can update
                    setState(() {
                      _controller.pickedMedicineIntakeTime = selectedTime;
                    });
                  }
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: "Godzina przyjęcia leku",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.schedule),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_controller.pickedMedicineIntakeTime!.format(context)),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
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
