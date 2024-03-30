import 'package:flutter/material.dart';

class IngredientToggleButton extends StatefulWidget {
  final String label;
  final VoidCallback onTogglePressed;
  final bool isToggledOn;
  const IngredientToggleButton(
      {super.key,
      required this.label,
      required this.onTogglePressed,
      required this.isToggledOn});

  @override
  State<IngredientToggleButton> createState() => _IngredientToggleButtonState();
}

class _IngredientToggleButtonState extends State<IngredientToggleButton> {
  @override
  Widget build(BuildContext context) {
    ButtonStyle standardTheme = ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(Size(10, 10)),
        padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 2, horizontal: 12)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ));

    ButtonStyle unselectedTheme = standardTheme.copyWith(
      foregroundColor:
          MaterialStatePropertyAll(Theme.of(context).colorScheme.primary),
      backgroundColor:
          MaterialStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
      textStyle: MaterialStatePropertyAll(
          Theme.of(context).textTheme.labelSmall!.copyWith(height: 1.0)),
    );

    ButtonStyle selectedTheme = standardTheme.copyWith(
      foregroundColor:
          MaterialStatePropertyAll(Theme.of(context).colorScheme.onPrimary),
      backgroundColor:
          MaterialStatePropertyAll(Theme.of(context).colorScheme.primary),
      textStyle: MaterialStatePropertyAll(
          Theme.of(context).textTheme.labelSmall!.copyWith(height: 1.0)),
    );

    return SizedBox(
      height: 25,
      child: OutlinedButton(
        style: widget.isToggledOn ? selectedTheme : unselectedTheme,
        onPressed: widget.onTogglePressed,
        child: Text(widget.label),
      ),
    );
  }
}
