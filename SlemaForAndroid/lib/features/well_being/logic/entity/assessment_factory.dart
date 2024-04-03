import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';

abstract class AssessmentFactory {
  /// Generates an [Assessment] with a unique ID. Note that the ID is in fact not unique and is just a randomized integer. This should not cause problems for the most part, as not many [Assessment] instances are to be generated by a single user.
  Future<Assessment> generateWithUniqueId();
}