import 'dart:convert';

import 'package:pg_slema/features/medicine/data/repository/notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesNotificationRepository
    implements NotificationRepository {
  @override
  List<Notification> getAllNotificationsOfMedicine(Medicine medicine) {
    return List<Notification>.empty();
    // TODO: implement getAllNotificationsOfMedicine
  }

  @override
  void deleteNotification(Notification notification) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> jsonNotificationsList = await _getNotificationsJsonStrings();

    jsonNotificationsList
        .map((jsonString) => jsonDecode(jsonString))
        .where((element) => element["id"] != notification.id.toString())
        .map((element) => jsonEncode(element));

    _updateNotificationsList(jsonNotificationsList);
    prefs.setStringList(
        Notification.notificationListSharedPrefKey, jsonNotificationsList);
  }

  @override
  void addNotification(Notification notification) async {
    List<String> jsonNotificationsList = await _getNotificationsJsonStrings();
    jsonNotificationsList.add(jsonEncode(notification));
    _updateNotificationsList(jsonNotificationsList);
  }

  @override
  void updateNotification(Notification notification) {
    deleteNotification(notification);
    addNotification(notification);
  }

  @override
  List<Notification> getAllNotifications() {
    throw UnimplementedError();
  }

  Future<List<String>> _getNotificationsJsonStrings() async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? jsonNotificationsList =
    prefs.getStringList(Notification.notificationListSharedPrefKey);
    return jsonNotificationsList ?? List<String>.empty();
  }

  void _updateNotificationsList(List<String> jsonNotificationsList) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList(
        Notification.notificationListSharedPrefKey, jsonNotificationsList);
  }
}
