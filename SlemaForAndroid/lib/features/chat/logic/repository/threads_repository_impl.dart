import 'package:pg_slema/features/chat/logic/entity/thread.dart';
import 'package:pg_slema/features/chat/logic/repository/threads_repository.dart';
import 'package:pg_slema/features/chat/logic/entity/last_message.dart';

class ThreadsRepositoryImpl implements ThreadsRepository {
  @override
  Future<List<Thread>> getAll() {
    // TODO
    return Future.delayed(
      const Duration(milliseconds: 300),
      () =>
          [Thread("Wątek 1", LastMessage()), Thread("Wątek 2", LastMessage())],
    );
  }
}
