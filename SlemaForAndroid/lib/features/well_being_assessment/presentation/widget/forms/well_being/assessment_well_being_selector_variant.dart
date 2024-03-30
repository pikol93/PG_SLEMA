import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/logic/entity/enum/well_being_variant.dart';

class AssessmentWellBeingSelectorVariant extends StatelessWidget {
  final WellBeingVariant variant;
  final Function(WellBeingVariant) pressed;
  final bool isSelected;

  const AssessmentWellBeingSelectorVariant(
      {super.key,
      required this.variant,
      required this.pressed,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: isSelected,
            child: const Icon(Icons.arrow_drop_down),
          ),
          IconButton(
            onPressed: onPressed,
            icon: variant.icon,
            padding: EdgeInsets.zero,
          ),
          Visibility(
            visible: isSelected,
            child: const Icon(Icons.arrow_drop_up),
          ),
        ],
      ),
    );
  }

  void onPressed() {
    pressed(variant);
  }
}
