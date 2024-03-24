import 'dart:async';

import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';

abstract class AssessmentsRepository {
  /// Gets all assessments from the repository sorted in a chronological order.
  Future<List<Assessment>> getAll();

  /// Updates an existing assessment or creates a new one in the repository.
  Future save(Assessment assessment);

  /// Removed an assessment from the repository.
  Future delete(int id);
}
