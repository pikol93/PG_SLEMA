import 'dart:convert';

import 'package:pg_slema/features/medicine/data/connector/shared_preferences_connector.dart';
import 'package:pg_slema/features/medicine/data/repository/notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/converter/notification_to_json_converter.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart';

class SharedPreferencesNotificationRepository
    implements NotificationRepository {

  final SharedPreferencesConnector connector = SharedPreferencesConnector();

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
    return connector.getList(Notification.notificationListSharedPrefKey);
  }

  void _updateNotificationsList(List<String> jsonNotificationsList) {
    connector.updateList(jsonNotificationsList, Notification.notificationListSharedPrefKey);
  }
}
