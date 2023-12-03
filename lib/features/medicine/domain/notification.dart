import 'package:flutter/material.dart';

enum Frequency { daily, everyTwoDays, everyThreeDays }

class Notification {
  static String notificationListSharedPrefKey = 'notifications';
  final String id;
  final TimeOfDay notificationTime;
  final DateTime firstNotificationDate;
  final DateTime lastNotificationDate;
  final Frequency notificationFrequency;

  Notification(this.id, this.notificationTime, this.firstNotificationDate,
      this.lastNotificationDate, this.notificationFrequency);
}
