import 'package:flutter/material.dart';
import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/repository/assessments_repository.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';

class AssessmentsServiceImpl implements AssessmentsService {
  final AssessmentsRepository repository;

  AssessmentsServiceImpl({required this.repository});

  @override
  Future<List<Assessment>> getAll() {
    return repository.getAll();
  }

  @override
  Future<Assessment?> getMostRecentAssessment() {
    return repository.getMostRecentAssessment();
  }

  @override
  Future saveEntry(Assessment assessment) {
    return repository.save(assessment);
  }

  @override
  Future deleteEntry(int id) {
    return repository.delete(id);
  }

  @override
  ChangeNotifier getAssessmentChangeNotifier() {
    return repository.getAssessmentChangeNotifier();
  }

  @override
  void clearAllAssessments() {
    repository.clearAllAssessments();
  }
}
