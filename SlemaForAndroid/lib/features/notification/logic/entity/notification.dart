import 'package:flutter/material.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';

class Notification {
  static const String notificationListSharedPrefKey = 'notifications';
  final String id;
  final String ownerId;
  final String title;
  final String body;
  final TimeOfDay notificationTime;
  final DateTime notificationDate;
  final Frequency notificationFrequency;
  final int scheduledId;

  Notification(
      this.id,
      this.ownerId,
      this.title,
      this.body,
      this.notificationTime,
      this.notificationDate,
      this.notificationFrequency,
      this.scheduledId);

  @override
  String toString() {
    return 'Notification{id: $id, ownerId: $ownerId, title: $title, body: $body, '
        'notificationTime: $notificationTime, notificationDate: $notificationDate,'
        'notificationFrequency: $notificationFrequency, '
        'scheduledId: $scheduledId}';
  }
}
