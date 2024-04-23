import 'package:dio/dio.dart';
import 'package:pg_slema/features/chat/logic/entity/thread/thread.dart';

abstract class ThreadsRepository {
  Future<List<Thread>> getAll();
  Future<Response?> createThread(Thread thread, String userId);
}
