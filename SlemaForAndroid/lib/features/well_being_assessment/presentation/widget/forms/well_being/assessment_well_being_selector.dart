import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being_assessment/presentation/widget/forms/well_being/assessment_well_being_selector_variant.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentWellBeingSelector extends StatelessWidget with Logger {
  const AssessmentWellBeingSelector({super.key});

  @override
  Widget build(BuildContext context) {
    var icon = const Image(
      height: 48,
      image: AssetImage("assets/placeholder_smiley.png"),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AssessmentWellBeingSelectorVariant(
              onPressed: onVariantWorstPressed,
              icon: icon,
            ),
            AssessmentWellBeingSelectorVariant(
              onPressed: onVariantBadPressed,
              icon: icon,
            ),
            AssessmentWellBeingSelectorVariant(
              onPressed: onVariantNeutralPressed,
              icon: icon,
            ),
            AssessmentWellBeingSelectorVariant(
              onPressed: onVariantGoodPressed,
              icon: icon,
            ),
            AssessmentWellBeingSelectorVariant(
              onPressed: onVariantBestPressed,
              icon: icon,
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Neutralny",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }

  void onVariantWorstPressed() {
    logger.debug("TODO: Implement me!");
  }

  void onVariantBadPressed() {
    logger.debug("TODO: Implement me!");
  }

  void onVariantNeutralPressed() {
    logger.debug("TODO: Implement me!");
  }

  void onVariantGoodPressed() {
    logger.debug("TODO: Implement me!");
  }

  void onVariantBestPressed() {
    logger.debug("TODO: Implement me!");
  }
}
