import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/presentation/controller/add_medicine_controller.dart';

class CustomSaveButton extends StatelessWidget {
  final AddMedicineController controller;
  final GlobalKey<FormState> formKey;
  final VoidCallback onAddedMedicine;

  const CustomSaveButton(
      {super.key,
      required this.controller,
      required this.formKey,
      required this.onAddedMedicine});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            try {
              addNewMedicine(context);
            } on Exception catch (_) {
              showInfoAboutIncorrectSave(context);
            }
          }
        },
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
        ),
        child: const Text(
          "Zapisz",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void addNewMedicine(BuildContext context) {
    onAddedMedicine.call();
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Zapisano pomyślnie!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void showInfoAboutIncorrectSave(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Błąd podczas zapisywania!'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
