import 'package:flutter/material.dart';

enum Frequency { singular, daily, everyTwoDays, everyThreeDays }

class Notification {
  static const String notificationListSharedPrefKey = 'notifications';
  final String id;
  final String medicineId;
  final String title;
  final String body;
  final TimeOfDay notificationTime;
  final DateTime firstNotificationDate;
  final DateTime lastNotificationDate;
  final Frequency notificationFrequency;
  final int scheduledId;

  Notification(
      this.id,
      this.medicineId,
      this.title,
      this.body,
      this.notificationTime,
      this.firstNotificationDate,
      this.lastNotificationDate,
      this.notificationFrequency,
      this.scheduledId);
}
