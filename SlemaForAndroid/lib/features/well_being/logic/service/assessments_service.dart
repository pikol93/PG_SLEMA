import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';

abstract class AssessmentsService {
  /// Gets all existing assessments in the chronological order.
  Future<List<Assessment>> getAll();

  /// Gets the most recent assessment stored in memory if it exists. Otherwise, null is returned.
  Future<Assessment?> getMostRecentAssessment();

  /// Saves an assessment in memory.
  Future saveEntry(Assessment assessment);

  /// Gets the assessment change notifier. The notifier is invoked when the list of assessment changes.
  ChangeNotifier getAssessmentChangeNotifier();
}
