import 'package:flutter/material.dart';

class CustomSaveButton extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  final VoidCallback onSaved;

  const CustomSaveButton({super.key, this.formKey, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ElevatedButton(
          onPressed: () {
            if (formKey?.currentState?.validate() ?? true) {
              try {
                saveForm(context);
              } on Exception catch (_) {
                showInfoAboutIncorrectSave(context);
              }
            }
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).primaryColor,
            ),
            elevation: MaterialStateProperty.all(6),
          ),
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

  void saveForm(BuildContext context) {
    onSaved();
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
