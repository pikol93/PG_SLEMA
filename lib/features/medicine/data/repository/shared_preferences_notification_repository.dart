import 'dart:convert';

import 'package:pg_slema/features/medicine/data/repository/notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/converter/notification_to_json_converter.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesNotificationRepository
    implements NotificationRepository {
  @override
  List<Notification> getAllNotificationsByMedicine(String medicineId) {
    _getJsonNotificationsList().then((jsonNotificationsList) {
      return jsonNotificationsList
          .map((jsonString) => jsonDecode(jsonString))
          .map((json) => NotificationToJsonConverter.fromJson(json))
          .where((element) => element.medicineId == medicineId)
          .toList(growable: true);
    });
    return List<Notification>.empty(growable: true);
  }

  @override
  void deleteNotification(Notification notification) {
    _getJsonNotificationsList().then((jsonNotificationsList) {
      jsonNotificationsList = jsonNotificationsList
          .map((jsonString) => jsonDecode(jsonString))
          .map((json) => NotificationToJsonConverter.fromJson(json))
          .where((element) => element.id == notification.id)
          .map((element) => NotificationToJsonConverter.toJson(element))
          .map((json) => jsonEncode(json))
          .toList(growable: true);
      _updateNotificationsList(jsonNotificationsList);
    });
  }

  @override
  void addNotification(Notification notification) {
    _getJsonNotificationsList().then((jsonNotificationsList) {
      final json = NotificationToJsonConverter.toJson(notification);
      jsonNotificationsList.add(jsonEncode(json));
      _updateNotificationsList(jsonNotificationsList);
    });
  }

  @override
  void updateNotification(Notification notification) {
    deleteNotification(notification);
    addNotification(notification);
  }

  @override
  List<Notification> getAllNotifications() {
    _getJsonNotificationsList().then((jsonNotificationsList) {
      return jsonNotificationsList
          .map((jsonString) => jsonDecode(jsonString))
          .map((json) => NotificationToJsonConverter.fromJson(json))
          .toList(growable: true);
    });
    return List<Notification>.empty(growable: true);
  }

  Future<List<String>> _getJsonNotificationsList() async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? jsonNotificationsList =
        prefs.getStringList(Notification.notificationListSharedPrefKey);
    return jsonNotificationsList ?? List<String>.empty(growable: true);
  }

  void _updateNotificationsList(List<String> jsonNotificationsList) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList(
        Notification.notificationListSharedPrefKey, jsonNotificationsList);
  }
}
