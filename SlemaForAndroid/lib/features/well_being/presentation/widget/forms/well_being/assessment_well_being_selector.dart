import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/well_being_variant.dart';
import 'package:pg_slema/features/well_being/presentation/widget/forms/well_being/assessment_well_being_selector_variant.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class AssessmentWellBeingSelector extends StatelessWidget with Logger {
  final Assessment assessment;
  final void Function(Assessment Function(Assessment)) onDataChanged;

  const AssessmentWellBeingSelector({
    super.key,
    required this.assessment,
    required this.onDataChanged,
  });

  @override
  Widget build(BuildContext context) {
    final children = WellBeingVariant.values
        .map(
          (e) => Expanded(
            child: AssessmentWellBeingSelectorVariant(
              variant: e,
              pressed: onVariantPressed,
              isSelected: e == assessment.wellBeing,
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
              assessment.wellBeing.textRepresentation,
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
    onDataChanged((assessment) {
      return assessment.copyWith(wellBeing: variant);
    });
  }
}
