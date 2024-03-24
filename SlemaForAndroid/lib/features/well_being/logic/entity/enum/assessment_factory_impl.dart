import 'dart:math';

import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment_factory.dart';

class AssessmentFactoryImpl implements AssessmentFactory {
  // TODO: :)
  static const int maxId = 4294967296;

  final random = Random();

  @override
  Assessment generateWithUniqueId() {
    return Assessment(
      id: random.nextInt(maxId),
      intakeDate: DateTime.now(),
    );
  }
}
