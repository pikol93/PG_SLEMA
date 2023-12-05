import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/utils/json/json_parser.dart';

class MedicineToJsonConverter {
  static Medicine fromJson(Map<String, dynamic> json) {
    return null;
    // return Notification(
    //     json['id'],
    //     json['title'],
    //     json['body'],
    //     JsonParser.parseTimeOfDayFromJson(json['notificationTime']),
    //     DateTime.parse(json['firstNotificationDate']),
    //     DateTime.parse(json['lastNotificationDate']),
    //     JsonParser.parseEnumFromJson<Frequency>(
    //         json['notificationFrequency'], Frequency.values));
  }

  static Map<String, dynamic> toJson(Medicine medicine) => {
    //
    // 'id': notification.id.toString(),
    // 'title': notification.title.toString(),
    // 'body': notification.body.toString(),
    // 'notificationTime':
    // JsonParser.parseTimeOfDayToJson(notification.notificationTime),
    // 'firstNotificationDate': notification.firstNotificationDate.toString(),
    // 'lastNotificationDate': notification.lastNotificationDate.toString(),
    // 'notificationFrequency':
    // JsonParser.parseEnumToJson(notification.notificationFrequency)
  };
}
