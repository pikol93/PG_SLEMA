import 'package:flutter/material.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';

class Notification {
  static const String notificationListSharedPrefKey = 'notifications';
  final String id;
  final String ownerId;
  final String title;
  final String body;
  final TimeOfDay notificationTime;
  final DateTime firstNotificationDate;
  final DateTime lastNotificationDate;
  final Frequency notificationFrequency;
  final int scheduledId;

  Notification(
      this.id,
      this.ownerId,
      this.title,
      this.body,
      this.notificationTime,
      this.firstNotificationDate,
      this.lastNotificationDate,
      this.notificationFrequency,
      this.scheduledId);
}
