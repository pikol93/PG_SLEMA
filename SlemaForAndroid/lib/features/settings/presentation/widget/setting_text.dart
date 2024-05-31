import 'package:flutter/material.dart';
import 'package:pg_slema/features/settings/presentation/widget/setting.dart';

class SettingText extends StatefulWidget {
  final String label;
  final String initialValue;
  final void Function(String) onConfirmPressed;

  const SettingText({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onConfirmPressed,
  });

  @override
  State<StatefulWidget> createState() => SettingTextState();
}

class SettingTextState extends State<SettingText> {
  late String currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.initialValue;
  }

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
          child: Stack(
            children: [
              Text(
                widget.label,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 0.0),
                child: Text(
                  currentValue,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget builder(BuildContext context) {
    return AlertDialog(
      content: TextFormField(
        autofocus: true,
        initialValue: currentValue,
        onChanged: (value) {
          currentValue = value;
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            widget.onConfirmPressed(currentValue);
          },
          child: const Text("Potwierdź"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Anuluj"),
        ),
      ],
    );
  }
}
