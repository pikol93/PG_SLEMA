import 'dart:async';

import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';

abstract class AssessmentsRepository {
  /// Gets [count] or less assessment elements from the repository. Returned elements are ordered chronologically.
  Future<List<Assessment>> get(int count);

  /// Updates an existing assessment or creates a new one in the repository.
  Future save(Assessment assessment);

  /// Removed an assessment from the repository.
  Future delete(int id);
}
