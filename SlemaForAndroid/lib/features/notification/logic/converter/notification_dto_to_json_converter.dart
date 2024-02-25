import 'package:flutter/material.dart';
import 'package:pg_slema/features/notification/logic/entity/notification_dto.dart';
import 'package:pg_slema/utils/data/converter.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';
import 'package:pg_slema/utils/id/integer_id_generator.dart';
import 'package:pg_slema/utils/json/json_parser.dart';

class NotificationDtoToJsonConverter
    with CustomConverter<NotificationDto, Map<String, dynamic>> {
  @override
  NotificationDto from(Map<String, dynamic> s) {
    return _fromJson(s);
  }

  @override
  Map<String, dynamic> to(NotificationDto t) {
    return _toJson(t);
  }

  NotificationDto _fromJson(Map<String, dynamic> json) {
    if (!json.containsKey('id')) {
      throw const FormatException("Missing 'id' key in JSON");
    }

    Frequency frequency = _getFrequency(json['notificationFrequency']);
    String firstNotificationDate =
        json['firstNotificationDate'] ?? DateTime.now().toString();
    String lastNotificationDate =
        json['lastNotificationDate'] ?? DateTime.now().toString();
    String notificationTime = json['notificationTime'] ??
        JsonParser.parseTimeOfDayToJson(const TimeOfDay(hour: 0, minute: 0));

    return NotificationDto(
        json['id'],
        json['ownerId'] ?? '',
        json['title'] ?? '',
        json['body'] ?? '',
        JsonParser.parseTimeOfDayFromJson(notificationTime),
        DateTime.parse(firstNotificationDate),
        DateTime.parse(lastNotificationDate),
        frequency,
        json['scheduledId'] ?? IntegerIdGenerator.generateRandomId(),
        json['delayBetweenNotifications'] ??
            frequency.defaultDelayBetweenIntakes);
  }

  Map<String, dynamic> _toJson(NotificationDto dto) => {
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
        'scheduledId': dto.scheduledId,
        'delayBetweenNotifications': dto.delayBetweenNotifications
      };

  Frequency _getFrequency(String? jsonKey) {
    Frequency frequency = Frequency.singular;
    try {
      frequency = JsonParser.parseEnumFromJson(jsonKey, Frequency.values);
    } on ArgumentError {
      //Frequency is initialized before try catch clause
    }
    return frequency;
  }
}
