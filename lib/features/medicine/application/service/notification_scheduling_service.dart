import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart' as nt;
import 'dart:async';
import 'package:timezone/timezone.dart' as tz;

class NotificationSchedulingService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }

  Future scheduleNotification(nt.Notification notification) async {
    switch (notification.notificationFrequency) {
      case nt.Frequency.singular:
        _scheduleSingularNotification(notification);
        break;
      default:
    }
  }

  Future cancelNotification(nt.Notification notification) async {
    await _flutterLocalNotificationsPlugin.cancel(notification.scheduledId);
  }

  Future _scheduleSingularNotification(nt.Notification notification) async {
    DateTime calculatedNotificationDateTime =
        _calculateSingularNotificationDateTime(notification);
    return _flutterLocalNotificationsPlugin.zonedSchedule(
        notification.scheduledId,
        notification.title,
        notification.body,
        tz.TZDateTime.from(calculatedNotificationDateTime, tz.local),
        await _generateDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  DateTime _calculateSingularNotificationDateTime(
      nt.Notification notification) {
    return DateTime(
        notification.lastNotificationDate.year,
        notification.lastNotificationDate.month,
        notification.lastNotificationDate.day,
        notification.notificationTime.hour,
        notification.notificationTime.minute);
  }

  NotificationDetails _generateDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }
}
