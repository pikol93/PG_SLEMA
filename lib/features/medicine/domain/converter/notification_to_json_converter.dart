import 'package:pg_slema/features/medicine/domain/notification.dart';
import 'package:pg_slema/utils/json/json_parser.dart';

class NotificationToJsonConverter {
  static Notification fromJson(Map<String, dynamic> json) {
    return Notification(
        json['id'],
        JsonParser.parseTimeOfDayFromJson(json['notificationTime']),
        DateTime.parse(json['firstNotificationDate']),
        DateTime.parse(json['lastNotificationDate']),
        JsonParser.parseEnumFromJson<Frequency>(
            json['notificationFrequency'], Frequency.values));
  }

  static Map<String, dynamic> toJson(Notification notification) => {
        'id': notification.id.toString(),
        'notificationTime':
            JsonParser.parseTimeOfDayToJson(notification.notificationTime),
        'firstNotificationDate': notification.firstNotificationDate.toString(),
        'lastNotificationDate': notification.lastNotificationDate.toString(),
        'notificationFrequency':
            JsonParser.parseEnumToJson(notification.notificationFrequency)
      };
}