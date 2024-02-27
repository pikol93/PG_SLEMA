import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pg_slema/features/notification/logic/entity/notification.dart'
    as nt;
import 'package:pg_slema/utils/frequency/frequency.dart';
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
        onDidReceiveLocalNotification: _receiveLocalNotificationOnIOS);

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
      case Frequency.singular:
        _scheduleSingularNotification(notification);
        break;
      case Frequency.daily:
        _scheduleDailyNotification(notification);
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
        _generateDetails("1", "singular"),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle);
  }

  Future _scheduleDailyNotification(nt.Notification notification) async {
    DateTime calculatedNotificationDateTime =
        _calculateDailyNotificationDate(notification);
    return _flutterLocalNotificationsPlugin.zonedSchedule(
        notification.scheduledId,
        notification.title,
        notification.body,
        tz.TZDateTime.from(calculatedNotificationDateTime, tz.local),
        _generateDetails("2", "daily"),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  DateTime _calculateDailyNotificationDate(nt.Notification notification) {
    var now = DateTime.now();
    return DateTime(
        now.year,
        now.month,
        now.day,
        notification.notificationTime.hour,
        notification.notificationTime.minute);
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

  NotificationDetails _generateDetails(String channelId, String channelName) {
    return NotificationDetails(
        android: AndroidNotificationDetails(channelId, channelName,
            importance: Importance.max,
            priority: Priority.max,
            playSound: true),
        iOS: const DarwinNotificationDetails());
  }

  void _receiveLocalNotificationOnIOS(
      int id, String? title, String? body, String? payload) async {}
}
