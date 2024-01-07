import 'package:pg_slema/features/notification/data/notification_dto.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';
import 'package:pg_slema/utils/id/integer_id_generator.dart';
import 'package:pg_slema/utils/json/json_parser.dart';

class NotificationDtoToJsonConverter {
  static NotificationDto fromJson(Map<String, dynamic> json) {
    return NotificationDto(
        json['id'],
        json.containsKey('ownerId') ? json['ownerId'] : '',
        json.containsKey('title') ? json['title'] : '',
        json.containsKey('body') ? json['body'] : '',
        JsonParser.parseTimeOfDayFromJson(json['notificationTime']),
        DateTime.parse(json['firstNotificationDate']),
        DateTime.parse(json['lastNotificationDate']),
        JsonParser.parseEnumFromJson<Frequency>(
            json['notificationFrequency'], Frequency.values),
        json.containsKey('scheduledId')
            ? json['scheduledId']
            : IntegerIdGenerator.generateRandomId());
  }

  static Map<String, dynamic> toJson(NotificationDto dto) => {
        'id': dto.id.toString(),
        'ownerId': dto.ownerId.toString(),
        'title': dto.title.toString(),
        'body': dto.body.toString(),
        'notificationTime':
            JsonParser.parseTimeOfDayToJson(dto.notificationTime),
        'firstNotificationDate': dto.firstNotificationDate.toString(),
        'lastNotificationDate': dto.lastNotificationDate.toString(),
        'notificationFrequency':
            JsonParser.parseEnumToJson(dto.notificationFrequency),
        'scheduledId': dto.scheduledId
      };
}
