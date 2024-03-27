import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';

abstract class AssessmentsRepository {
  /// Gets all assessments from the repository sorted in a chronological order.
  Future<List<Assessment>> getAll();

  /// Updates an existing assessment or creates a new one in the repository.
  Future save(Assessment assessment);

  /// Removed an assessment from the repository.
  Future delete(int id);

  /// Gets the assessment change notifier. The notifier is invoked when the list of assessment changes.
  ChangeNotifier getAssessmentChangeNotifier();

  /// Gets the most recent assessment stored in the repository. Returns null if no assessment is present.
  Future<Assessment?> getMostRecentAssessment();
}
