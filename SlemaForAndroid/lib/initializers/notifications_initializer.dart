import 'package:flutter/material.dart' as mt;
import 'package:pg_slema/features/notification/logic/entity/notification.dart';
import 'package:pg_slema/features/notification/logic/service/notification_scheduling_service.dart';
import 'package:pg_slema/features/notification/logic/service/notification_service.dart';
import 'package:pg_slema/initializers/initializer.dart';
import 'package:pg_slema/utils/date/date.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';
import 'package:pg_slema/utils/time_of_day/time_of_day_comparing_extension.dart';

class NotificationsInitializer with Initializer {
  final NotificationService _notificationService;

  final NotificationSchedulingService _schedulingService;

  NotificationsInitializer(this._notificationService, this._schedulingService);

  @override
  Future initialize() async {
    var notifications = await _notificationService.getAllNotifications();
    for (var notification in notifications) {
      if(notification.notificationFrequency != Frequency.singular || isNotificationInFuture(notification)) {
        _schedulingService.cancelNotification(notification);
        _schedulingService.scheduleNotification(notification);
      }
    }
  }

  bool isNotificationInFuture(Notification notification) {
    var now = DateTime.now();
    int compareDates =  notification.notificationDate.compareDates(now);
    bool compareTimes = notification.notificationTime.isHigher(mt.TimeOfDay(hour: now.hour, minute: now.minute));
    return compareDates > 0 || compareDates == 0 && compareTimes ;
  }
}
