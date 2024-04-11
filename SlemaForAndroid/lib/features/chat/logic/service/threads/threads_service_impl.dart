import 'package:pg_slema/features/chat/logic/repository/threads/threads_repository.dart';
import 'package:pg_slema/features/chat/logic/service/threads/threads_service.dart';
import 'package:pg_slema/features/chat/logic/entity/thread.dart';

class ThreadsServiceImpl implements ThreadsService {
  final ThreadsRepository threadsRepository;
  ThreadsServiceImpl(this.threadsRepository);

  @override
  bool isAnyThreadAvailable() {
    // TODO
    return true;
  }

  @override
  Future<List<Thread>> getAll() {
    return threadsRepository.getAll();
  }
}
