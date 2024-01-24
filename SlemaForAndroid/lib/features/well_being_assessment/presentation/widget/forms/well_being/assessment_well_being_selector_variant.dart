import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/data/well_being_variant.dart';

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
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(16),
              color: variant.colorRepresentation,
            ),
            child: IconButton(onPressed: onPressed, icon: variant.icon),
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
