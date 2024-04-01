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

  String value = "";

  @override
  Widget build(BuildContext context) {
    return Container(
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
              // TODO: This settings seem to make no difference. Fix displaying the text.
              child: TextFormField(
                onChanged: onChanged,
                // TODO: Fix text not disappearing after clicking the add button.
                initialValue: value,
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: labelFontSize,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            )
          ],
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
      value = "";
    });
  }
}
