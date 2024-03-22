import 'package:pg_slema/features/well_being/logic/repository/assessments_repository.dart';
import 'package:pg_slema/features/well_being/logic/service/assessments_service.dart';

class AssessmentsServiceImpl implements AssessmentsService {
  final AssessmentsRepository repository;

  AssessmentsServiceImpl({required this.repository});
}
