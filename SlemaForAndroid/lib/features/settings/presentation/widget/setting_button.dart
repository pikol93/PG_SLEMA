import 'package:flutter/material.dart';
import 'package:pg_slema/features/settings/presentation/widget/setting.dart';

class SettingButton extends StatelessWidget {
  final String label;
  final String alertDialogTitle;
  final String alertDialogContent;
  final void Function() onConfirmPressed;

  const SettingButton({
    super.key,
    required this.label,
    required this.alertDialogTitle,
    required this.alertDialogContent,
    required this.onConfirmPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Setting(
      child: Expanded(
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: builder,
              barrierDismissible: true,
            );
          },
          child: Text(
            label,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }

  Widget builder(BuildContext context) {
    return AlertDialog(
      title: Text(alertDialogTitle),
      content: Text(alertDialogContent),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirmPressed();
          },
          child: const Text("Tak"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Nie"),
        ),
      ],
    );
  }
}
