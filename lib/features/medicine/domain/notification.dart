import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Frequency { daily, everyTwoDays, everyThreeDays }

class Notification {
  final Uuid id;
  final TimeOfDay notificationTime;
  final DateTime firstNotificationDate;
  final DateTime lastNotificationDate;
  final Frequency notificationFrequency;

  Notification(this.id, this.notificationTime, this.firstNotificationDate,
      this.lastNotificationDate, this.notificationFrequency);
}
