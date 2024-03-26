import 'dart:math';

import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment_factory.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/symptom_entries.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/well_being_variant.dart';

class AssessmentFactoryImpl implements AssessmentFactory {
  // TODO: :)
  static const int maxId = 4294967296;

  final random = Random();

  @override
  Assessment generateWithUniqueId() {
    return Assessment(
      id: random.nextInt(maxId),
      intakeDate: DateTime.now(),
      wellBeing: WellBeing.neutral,
      symptomEntries: SymptomEntries(
        // TODO: Insert symptom entries from the most recent assessment.
        symptomEntries: [],
      ),
    );
  }
}
