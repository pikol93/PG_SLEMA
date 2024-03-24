import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';

abstract class AssessmentsService {
  /// Gets all existing assessments in the chronological order.
  Future<List<Assessment>> getAll();

  /// TODO: Finish docs.
  Future saveEntry(Assessment assessment);
}
