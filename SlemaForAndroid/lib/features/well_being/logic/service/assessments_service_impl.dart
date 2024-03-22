import 'package:pg_slema/features/well_being/logic/entity/assessment.dart';
import 'package:pg_slema/features/well_being/logic/repository/assessments_repository.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';

class AssessmentsServiceImpl implements AssessmentsService {
  final AssessmentsRepository repository;

  AssessmentsServiceImpl({required this.repository});

  @override
  Future<List<Assessment>> getTopEntries(int count) {
    return repository.get(count);
  }

  @override
  Future saveEntry(Assessment assessment) {
    return repository.save(assessment);
  }
}
