import 'package:flutter/material.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class SymptomsBottomBar extends StatefulWidget {
  final void Function(String) onSymptomAddPressed;

  const SymptomsBottomBar({
    super.key,
    required this.onSymptomAddPressed,
  });

  @override
  State<SymptomsBottomBar> createState() => SymptomsBottomBarState();
}

class SymptomsBottomBarState extends State<SymptomsBottomBar> with Logger {
  final double labelFontSize = 48.0;
  final formKey = GlobalKey<FormState>();

  String value = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 64.0,
          maxHeight: 64.0,
        ),
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                onPressed: onAddPressed,
                icon: const Icon(Icons.add),
              ),
              Expanded(
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.bottom,
                  onChanged: onChanged,
                  initialValue: value,
                  style: Theme.of(context).textTheme.labelSmall,
                  decoration: const InputDecoration(
                    hintText: "Wprowadź nazwę symptomu",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onChanged(String newValue) {
    value = newValue;
  }

  void onAddPressed() {
    logger.debug("Pressed add button.");
    widget.onSymptomAddPressed(value);
    setState(() {
      formKey.currentState?.reset();
      value = "";
    });
  }
}
