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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0))),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
              elevation: MaterialStateProperty.all(6)),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Center(
              child: Text(
                "Zapisz",
                style: TextStyle(
                    fontFamily: 'Dongle',
                    fontSize: 46,
                    height: 0.52381,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onPrimary),
                textAlign: TextAlign.center,
              ),
            ),
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