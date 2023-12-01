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

    List<String>? jsonNotificationsList =
        prefs.getStringList(Notification.notificationListSharedPrefKey);

    if (jsonNotificationsList == null) {
      return;
    }
    
    jsonNotificationsList
        .map((jsonString) => jsonDecode(jsonString))
        .where((element) => element["id"] != notification.id.toString())
        .map((element) => jsonEncode(element));

    prefs.setStringList(
        Notification.notificationListSharedPrefKey, jsonNotificationsList);
  }

  @override
  void addNotification(Notification notification) {
    // TODO: implement addNotification
  }

  @override
  void updateNotification(Notification notification) {
    // TODO: implement updateNotification
  }
}
