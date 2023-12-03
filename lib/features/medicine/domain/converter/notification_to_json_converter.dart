import 'package:pg_slema/features/medicine/domain/notification.dart';
import 'package:pg_slema/utils/json/json_parser.dart';

class NotificationToJsonConverter {
  Notification fromJson(Map<String, dynamic> json) {
    return Notification(
        json['id'],
        JsonParser.parseTimeOfDay(json['notificationTime']),
        DateTime.parse(json['firstNotificationDate']),
        DateTime.parse(json['lastNotificationDate']),
        JsonParser.parseEnum<Frequency>(
            json['notificationFrequency'], Frequency.values));
  }
}
