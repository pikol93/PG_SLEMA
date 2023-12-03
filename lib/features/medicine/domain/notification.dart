import 'package:flutter/material.dart';

enum Frequency { singular, daily, everyTwoDays, everyThreeDays }

class Notification {
  static String notificationListSharedPrefKey = 'notifications';
  final String id;
  final String title;
  final String body;
  final TimeOfDay notificationTime;
  final DateTime firstNotificationDate;
  final DateTime lastNotificationDate;
  final Frequency notificationFrequency;

  Notification(
      this.id,
      this.title,
      this.body,
      this.notificationTime,
      this.firstNotificationDate,
      this.lastNotificationDate,
      this.notificationFrequency);
}
