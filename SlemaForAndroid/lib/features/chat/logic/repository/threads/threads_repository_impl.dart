import 'package:dio/dio.dart';
import 'package:pg_slema/features/chat/logic/converter/thread_dto_converter.dart';
import 'package:pg_slema/features/chat/logic/entity/thread.dart';
import 'package:pg_slema/features/chat/logic/repository/threads/threads_repository.dart';
import 'package:pg_slema/features/chat/logic/entity/thread_dto.dart';
import 'package:pg_slema/features/chat/logic/repository/network_repository.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class ThreadsRepositoryImpl
    with NetworkRepository, Logger
    implements ThreadsRepository {
  late final Dio dio;
  ThreadsRepositoryImpl() {
    dio = createDioInstance();
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

    return Future.delayed(
      const Duration(milliseconds: 0),
      () => [],
    );
  }
}
