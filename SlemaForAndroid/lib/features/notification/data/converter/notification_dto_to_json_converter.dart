import 'package:pg_slema/features/notification/data/notification_dto.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';
import 'package:pg_slema/utils/json/json_parser.dart';

class NotificationDtoToJsonConverter {
  static NotificationDto fromJson(Map<String, dynamic> json) {
    return NotificationDto(
        json['id'],
        json['ownerId'],
        json['title'],
        json['body'],
        JsonParser.parseTimeOfDayFromJson(json['notificationTime']),
        DateTime.parse(json['firstNotificationDate']),
        DateTime.parse(json['lastNotificationDate']),
        JsonParser.parseEnumFromJson<Frequency>(
            json['notificationFrequency'], Frequency.values),
        json['scheduledId']);
  }

  static Map<String, dynamic> toJson(NotificationDto notification) => {
        'id': notification.id.toString(),
        'ownerId': notification.ownerId.toString(),
        'title': notification.title.toString(),
        'body': notification.body.toString(),
        'notificationTime':
            JsonParser.parseTimeOfDayToJson(notification.notificationTime),
        'firstNotificationDate': notification.firstNotificationDate.toString(),
        'lastNotificationDate': notification.lastNotificationDate.toString(),
        'notificationFrequency':
            JsonParser.parseEnumToJson(notification.notificationFrequency),
        'scheduledId': notification.scheduledId
      };
}
