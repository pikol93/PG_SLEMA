import 'dart:convert';

import 'package:pg_slema/features/medicine/data/repository/notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/converter/notification_to_json_converter.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesNotificationRepository
    implements NotificationRepository {
  late SharedPreferences prefs;

  void initializeRepository() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  List<Notification> getAllNotificationsOfMedicine(String medicineId) {
    return List<Notification>.empty(growable: true);
    // TODO: implement getAllNotificationsOfMedicine
  }

  @override
  Future deleteNotification(Notification notification) async {
    List<String> jsonNotificationsList = await _getJsonNotificationsList();
    jsonNotificationsList = jsonNotificationsList
        .map((jsonString) => jsonDecode(jsonString))
        .map((json) => NotificationToJsonConverter.fromJson(json))
        .where((element) =>
            element.id.compareTo(notification.id) == 0 ? false : true)
        .map((element) => NotificationToJsonConverter.toJson(element))
        .map((json) => jsonEncode(json))
        .toList();
    _updateNotificationsList(jsonNotificationsList);
  }

  @override
  Future addNotification(Notification notification) async {
    List<String> jsonNotificationsList = await _getJsonNotificationsList();
    final json = NotificationToJsonConverter.toJson(notification);
    jsonNotificationsList.add(jsonEncode(json));
    _updateNotificationsList(jsonNotificationsList);
    print(jsonNotificationsList);
    getAllNotifications().asStream().forEach((element) {print(element);});
  }

  @override
  Future updateNotification(Notification notification) async {
    await deleteNotification(notification);
    addNotification(notification);
  }

  @override
  Future<List<Notification>> getAllNotifications() async {
    List<String> jsonNotificationsList = await _getJsonNotificationsList();
    return jsonNotificationsList
        .map((jsonString) => jsonDecode(jsonString))
        .map((json) => NotificationToJsonConverter.fromJson(json))
        .toList();
  }

  Future<List<String>> _getJsonNotificationsList() async {
    List<String>? jsonNotificationsList =
        prefs.getStringList(Notification.notificationListSharedPrefKey);
    return jsonNotificationsList ?? List<String>.empty(growable: true);
  }

  void _updateNotificationsList(List<String> jsonNotificationsList) async {
    prefs.setStringList(
        Notification.notificationListSharedPrefKey, jsonNotificationsList);
  }
}
