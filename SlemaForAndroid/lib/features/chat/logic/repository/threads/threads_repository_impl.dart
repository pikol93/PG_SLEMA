import 'package:dio/dio.dart';
import 'package:pg_slema/features/chat/logic/converter/thread_dto_converter.dart';
import 'package:pg_slema/features/chat/logic/entity/thread/thread.dart';
import 'package:pg_slema/features/chat/logic/repository/threads/threads_repository.dart';
import 'package:pg_slema/features/chat/logic/entity/thread/thread_dto.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class ThreadsRepositoryImpl with Logger implements ThreadsRepository {
  final Dio dio;

  ThreadsRepositoryImpl({
    required this.dio,
  }) {
    logger.debug(
        "Created threads repository with address: ${dio.options.baseUrl}");
  }

  @override
  Future<List<Thread>> getAll() async {
    try {
      return dio.get("/api/conversations").then((response) {
        return (response.data['conversations'] ?? [])
            .map<Thread>((thread) =>
                ThreadDtoConverter.fromDto(ThreadDto.fromJson(thread)))
            .toList();
      });
    } catch (e) {
      logger.error(e);
    }

    return Future.value([]);
  }

  @override
  Future<Response?> createThread(Thread thread, String userId) {
    try {
      return dio.put("/api/conversations/${thread.id}",
          data: ThreadDtoConverter.toDto(thread).toJson(userId));
    } catch (e) {
      logger.error(e);
    }

    return Future.value(null);
  }
}
