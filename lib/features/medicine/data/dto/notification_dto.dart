import 'package:flutter/material.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart';

class NotificationDto {
  static String notificationListSharedPrefKey = 'notifications';
  final String id;
  final String medicineId;
  final String title;
  final String body;
  final TimeOfDay notificationTime;
  final DateTime firstNotificationDate;
  final DateTime lastNotificationDate;
  final Frequency notificationFrequency;
  final int scheduledId;

  NotificationDto(
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
