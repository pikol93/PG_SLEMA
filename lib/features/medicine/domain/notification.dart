import 'package:flutter/material.dart';

enum Frequency { daily, everyTwoDays, everyThreeDays }

class Notification {
  final TimeOfDay notificationTime;
  final DateTime firstNotificationDate;
  final DateTime lastNotificationDate;
  final Frequency notificationFrequency;

  Notification(this.notificationTime, this.firstNotificationDate,
      this.lastNotificationDate, this.notificationFrequency);
}
