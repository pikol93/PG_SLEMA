import 'package:pg_slema/features/chat/logic/entity/thread.dart';

abstract class ThreadsService {
  bool isAnyThreadAvailable();

  Future<List<Thread>> getAll();
}
