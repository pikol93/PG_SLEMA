import 'package:pg_slema/features/chat/logic/entity/thread.dart';

abstract class ThreadsRepository {
  Future<List<Thread>> getAll();
}
