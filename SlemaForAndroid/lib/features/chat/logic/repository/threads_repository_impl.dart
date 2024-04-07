import 'package:pg_slema/features/chat/logic/converter/thread_dto_converter.dart';
import 'package:pg_slema/features/chat/logic/entity/thread.dart';
import 'package:pg_slema/features/chat/logic/repository/threads_repository.dart';
import 'package:pg_slema/features/chat/logic/entity/thread_dto.dart';
import 'package:uuid/uuid.dart';

class ThreadsRepositoryImpl implements ThreadsRepository {
  @override
  Future<List<Thread>> getAll() {
    // TODO get from server
    List<ThreadDto> threads = [
      ThreadDto(
        const Uuid().toString(),
        "Watek1",
        "Tutaj napisalem bardzo dlugą wiadomość, użyj ellipsis..........",
        DateTime.now().toIso8601String(),
        "Ty",
      ),
      ThreadDto(
        const Uuid().toString(),
        "Watek2",
        "Tutaj otrzymana krótsza wiadomość",
        DateTime.now().toIso8601String(),
        "Wolontariusz Serwer Marek",
      ),
    ];

    return Future.delayed(
      const Duration(milliseconds: 500),
      () => threads.map((e) => ThreadDtoConverter.fromDto(e)).toList(),
    );
  }
}
