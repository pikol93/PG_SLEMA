import 'package:flutter/material.dart';
import 'package:pg_slema/features/notification/domain/get_notification.dart';
import 'package:uuid/uuid.dart';

class GetNotificationController {
  final notification = GetNotification(const Uuid().v4(), TimeOfDay.now());

  void onTimeChanged(TimeOfDay time) {
    notification.notificationTime = time;
  }
}
