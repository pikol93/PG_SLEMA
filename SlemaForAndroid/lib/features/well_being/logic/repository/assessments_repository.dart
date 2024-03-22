import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';

abstract class AssessmentsRepository {
  /// Updates an existing assessment or creates a new one in the repository.
  Future save(Assessment assessment);

  /// Removed an assessment from the repository.
  Future delete(int id);
}
