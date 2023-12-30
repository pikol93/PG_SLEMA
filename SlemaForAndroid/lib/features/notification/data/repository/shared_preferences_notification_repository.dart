import 'dart:convert';

import 'package:pg_slema/features/notification/data/converter/notification_dto_to_json_converter.dart';
import 'package:pg_slema/features/notification/data/repository/notification_repository.dart';
import 'package:pg_slema/features/notification/domain/converter/notification_to_dto_converter.dart';
import 'package:pg_slema/features/notification/domain/notification.dart';
import 'package:pg_slema/utils/connector/shared_preferences_connector.dart';

class SharedPreferencesNotificationRepository
    implements NotificationRepository {
  final SharedPreferencesConnector connector = SharedPreferencesConnector();

  @override
  Future<List<Notification>> getAllNotificationsByMedicine(
      String medicineId) async {
    var jsonNotificationsList = await _getJsonNotificationsList();
    return jsonNotificationsList
        .map(jsonDecode)
        .map((json) => NotificationDtoToJsonConverter.fromJson(json))
        .where((element) => element.ownerId == medicineId)
        .map(NotificationToDtoConverter.fromDto)
        .toList(growable: true);
  }

  @override
  Future deleteNotification(Notification notification) async {
    var jsonNotificationsList = await _getJsonNotificationsList();
    jsonNotificationsList = jsonNotificationsList
        .map(jsonDecode)
        .map((json) => NotificationDtoToJsonConverter.fromJson(json))
        .where((element) => element.id == notification.id)
        .map(NotificationDtoToJsonConverter.toJson)
        .map(jsonEncode)
        .toList(growable: true);
    await _updateNotificationsList(jsonNotificationsList);
  }

  @override
  Future addNotification(Notification notification) async {
    var jsonNotificationsList = await _getJsonNotificationsList();
    final dto = NotificationToDtoConverter.toDto(notification);
    final json = NotificationDtoToJsonConverter.toJson(dto);
    jsonNotificationsList.add(jsonEncode(json));
    await _updateNotificationsList(jsonNotificationsList);
  }

  @override
  Future updateNotification(Notification notification) async {
    List<Notification> notifications = await getAllNotifications();
    final index =
        notifications.indexWhere((element) => element.id == notification.id);
    notifications[index] = notification;
    final jsonNotificationsList = notifications
        .map(NotificationToDtoConverter.toDto)
        .map(NotificationDtoToJsonConverter.toJson)
        .map(jsonEncode)
        .toList(growable: true);
    _updateNotificationsList(jsonNotificationsList);
  }

  @override
  Future<List<Notification>> getAllNotifications() async {
    var jsonNotificationsList = await _getJsonNotificationsList();
    return jsonNotificationsList
        .map(jsonDecode)
        .map((json) => NotificationDtoToJsonConverter.fromJson(json))
        .map(NotificationToDtoConverter.fromDto)
        .toList(growable: true);
  }

  @override
  Future deleteAll(List<Notification> notifications) async {
    var notificationsIds = notifications.map((e) => e.id).toList();

    var jsonNotificationsList = await _getJsonNotificationsList();
    jsonNotificationsList = jsonNotificationsList
        .map((jsonString) => jsonDecode(jsonString))
        .map((json) => NotificationDtoToJsonConverter.fromJson(json))
        .where((element) => !notificationsIds.contains(element.id))
        .map((element) => NotificationDtoToJsonConverter.toJson(element))
        .map((json) => jsonEncode(json))
        .toList(growable: true);
    await _updateNotificationsList(jsonNotificationsList);
  }

  Future<List<String>> _getJsonNotificationsList() async {
    return await connector.getList(Notification.notificationListSharedPrefKey);
  }

  Future _updateNotificationsList(List<String> jsonNotificationsList) async {
    return await connector.updateList(
        jsonNotificationsList, Notification.notificationListSharedPrefKey);
  }
}

//TODO: add method replace notifications - remove if exists.. then add all, then call it on edit medicine
