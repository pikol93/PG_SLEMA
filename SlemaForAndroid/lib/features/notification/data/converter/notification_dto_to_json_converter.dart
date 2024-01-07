import 'package:flutter/material.dart';
import 'package:pg_slema/features/notification/data/notification_dto.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';
import 'package:pg_slema/utils/id/integer_id_generator.dart';
import 'package:pg_slema/utils/json/json_parser.dart';

class NotificationDtoToJsonConverter {
  static NotificationDto fromJson(Map<String, dynamic> json) {
    String firstNotificationDate = json.containsKey('firstNotificationDate')
        ? json['firstNotificationDate']
        : DateTime.now().toString();
    String lastNotificationDate = json.containsKey('lastNotificationDate')
        ? json['lastNotificationDate']
        : DateTime.now().toString();
    String frequency = json.containsKey('NotificationFrequency')
        ? json['NotificationFrequency']
        : JsonParser.parseEnumToJson(Frequency.singular);
    String notificationTime = json.containsKey('notificationTime')
        ? json['notificationTime']
        : JsonParser.parseTimeOfDayToJson(const TimeOfDay(hour: 0, minute: 0));
    return NotificationDto(
        json['id'],
        json.containsKey('ownerId') ? json['ownerId'] : '',
        json.containsKey('title') ? json['title'] : '',
        json.containsKey('body') ? json['body'] : '',
        JsonParser.parseTimeOfDayFromJson(notificationTime),
        DateTime.parse(firstNotificationDate),
        DateTime.parse(lastNotificationDate),
        JsonParser.parseEnumFromJson<Frequency>(frequency, Frequency.values),
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
