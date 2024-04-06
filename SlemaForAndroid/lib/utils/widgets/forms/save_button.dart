import 'package:flutter/material.dart';
import 'package:pg_slema/utils/widgets/default_circular_button.dart';

class CustomSaveButton extends StatelessWidget {
  final GlobalKey<FormState>? formKey;
  final VoidCallback onSaved;

  const CustomSaveButton({super.key, this.formKey, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return DefaultCircularButton(
        onPressed: () => _onSaveButtonPressed(context), label: "Zapisz");
  }

  void _onSaveButtonPressed(BuildContext context) {
    if (formKey?.currentState?.validate() ?? true) {
      try {
        _saveForm(context);
      } on Exception catch (_) {
        _showInfoAboutIncorrectSave(context);
      }
    }
  }

  void _saveForm(BuildContext context) {
    onSaved();
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Zapisano pomyślnie!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showInfoAboutIncorrectSave(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Błąd podczas zapisywania!'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
