import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/well_being_variant.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/well_being/assessment_well_being_selector_variant.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentWellBeingSelector extends StatelessWidget with Logger {
  const AssessmentWellBeingSelector({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Keep this value in a state somewhere
    const selectedValue = WellBeingVariant.neutral;

    final children = WellBeingVariant.values
        .map(
          (e) => Expanded(
            child: AssessmentWellBeingSelectorVariant(
              variant: e,
              pressed: onVariantPressed,
              isSelected: e == selectedValue,
            ),
          ),
        )
        .toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedValue.textRepresentation,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ],
    );
  }

  void onVariantPressed(WellBeingVariant variant) {
    logger.debug("Pressed well being variant: $variant");
  }
}
