import 'package:flutter/material.dart';
import 'package:pg_slema/utils/data/dto.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';

class NotificationDto with Dto {
  @override
  final String id;
  final String ownerId;
  final String title;
  final String body;
  final TimeOfDay notificationTime;
  final DateTime notificationDate;
  final Frequency notificationFrequency;
  final int scheduledId;

  NotificationDto(
      this.id,
      this.ownerId,
      this.title,
      this.body,
      this.notificationTime,
      this.notificationDate,
      this.notificationFrequency,
      this.scheduledId);
}
