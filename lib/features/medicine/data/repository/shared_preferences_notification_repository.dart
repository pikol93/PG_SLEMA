import 'dart:convert';

import 'package:pg_slema/features/medicine/data/connector/shared_preferences_connector.dart';
import 'package:pg_slema/features/medicine/data/repository/notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/converter/notification_to_json_converter.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart';

class SharedPreferencesNotificationRepository
    implements NotificationRepository {
  final SharedPreferencesConnector connector = SharedPreferencesConnector();

  @override
  Future<List<Notification>> getAllNotificationsByMedicine(
      String medicineId) async {
    var jsonNotificationsList = await _getJsonNotificationsList();
    return jsonNotificationsList
        .map((jsonString) => jsonDecode(jsonString))
        .map((json) => NotificationToJsonConverter.fromJson(json))
        .where((element) => element.medicineId == medicineId)
        .toList(growable: true);
  }

  @override
  Future deleteNotification(Notification notification) async {
    var jsonNotificationsList = await _getJsonNotificationsList();
    jsonNotificationsList = jsonNotificationsList
        .map((jsonString) => jsonDecode(jsonString))
        .map((json) => NotificationToJsonConverter.fromJson(json))
        .where((element) => element.id == notification.id)
        .map((element) => NotificationToJsonConverter.toJson(element))
        .map((json) => jsonEncode(json))
        .toList(growable: true);
    _updateNotificationsList(jsonNotificationsList);
  }

  @override
  Future addNotification(Notification notification) async {
    var jsonNotificationsList = await _getJsonNotificationsList();
    final json = NotificationToJsonConverter.toJson(notification);
    jsonNotificationsList.add(jsonEncode(json));
    _updateNotificationsList(jsonNotificationsList);
  }

  @override
  Future updateNotification(Notification notification) async {
    await deleteNotification(notification);
    addNotification(notification);
  }

  @override
  Future<List<Notification>> getAllNotifications() async {
    var jsonNotificationsList = await _getJsonNotificationsList();
    return jsonNotificationsList
        .map((jsonString) => jsonDecode(jsonString))
        .map((json) => NotificationToJsonConverter.fromJson(json))
        .toList(growable: true);
  }

  Future<List<String>> _getJsonNotificationsList() async {
    return connector.getList(Notification.notificationListSharedPrefKey);
  }

  Future _updateNotificationsList(List<String> jsonNotificationsList) async {
    connector.updateList(
        jsonNotificationsList, Notification.notificationListSharedPrefKey);
  }
}
