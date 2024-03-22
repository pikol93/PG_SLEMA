import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';

abstract class AssessmentsService {
  /// Gets [count] top entries in the chronological order.
  Future<List<Assessment>> getTopEntries(int count);

  /// TODO: Finish docs.
  Future saveEntry(Assessment assessment);
}
