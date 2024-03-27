import 'dart:math';

import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment_factory.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/sleep_duration.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/sleep_quality.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/symptom_entries.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/symptom_value.dart';
import 'package:pg_slema/features/well_being/logic/entity/enum/well_being_variant.dart';
import 'package:pg_slema/features/well_being/logic/entity/symptom_entry.dart';
import 'package:pg_slema/features/well_being/logic/repository/assessments_repository.dart';

class AssessmentFactoryImpl implements AssessmentFactory {
  // TODO: :)
  static const int maxId = 4294967296;

  final random = Random();

  final AssessmentsRepository repository;

  AssessmentFactoryImpl({
    required this.repository,
  });

  @override
  Future<Assessment> generateWithUniqueId() async {
    return Assessment(
      id: random.nextInt(maxId),
      intakeDate: DateTime.now(),
      wellBeing: WellBeing.neutral,
      symptomEntries: await _getMostRecentSymptomEntriesOrDefault(),
      sleepDuration: SleepDuration.from7To8Hours,
      sleepQuality: SleepQuality.neutral,
    );
  }

  Future<SymptomEntries> _getMostRecentSymptomEntriesOrDefault() async {
    Assessment? mostRecentAssessment =
        await repository.getMostRecentAssessment();
    if (mostRecentAssessment == null) {
      return _getDefaultSymptomEntries();
    }

    return mostRecentAssessment.symptomEntries;
  }

  SymptomEntries _getDefaultSymptomEntries() {
    return SymptomEntries(
      symptomEntries: [
        SymptomEntry(name: "Zmiany skórne", value: SymptomValue.none),
        SymptomEntry(name: "Ból stawów", value: SymptomValue.none),
        SymptomEntry(name: "Mdłości", value: SymptomValue.none),
      ],
    );
  }
}
