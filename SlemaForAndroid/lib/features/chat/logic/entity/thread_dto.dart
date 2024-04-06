import 'package:pg_slema/utils/data/dto.dart';
import 'package:pg_slema/features/chat/logic/entity/last_message.dart';

class ThreadDto implements Dto {
  //TODO
  @override
  final String id;
  final String title;
  final LastMessage lastMessage; //TODO Delete it
  ThreadDto(this.id, this.title, this.lastMessage);
}
