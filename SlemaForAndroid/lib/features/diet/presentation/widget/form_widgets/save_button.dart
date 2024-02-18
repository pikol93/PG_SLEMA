import 'package:flutter/material.dart';
import 'package:pg_slema/theme/custom_colors.dart';

class CustomSaveButton extends StatelessWidget {
  final VoidCallback onSaveButtonClicked;

  const CustomSaveButton({super.key, required this.onSaveButtonClicked});

  @override
  Widget build(BuildContext context) {
    final MyColors? myColors = Theme.of(context).extension<MyColors>();

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ElevatedButton(
          onPressed: () {
            try {
              saveDishes(context);
            } on Exception catch (_) {
              showInfoAboutIncorrectSave(context);
            }
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0))),
              backgroundColor: MaterialStateProperty.all<Color>(
                  myColors!.formsButtonBackgroundColor ?? Colors.black),
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
                  color: myColors.formsButtonTextColor ?? Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void saveDishes(BuildContext context) {
    onSaveButtonClicked();
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
