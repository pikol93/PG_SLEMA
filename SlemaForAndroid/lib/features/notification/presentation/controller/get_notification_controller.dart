import 'package:flutter/material.dart';
import 'package:pg_slema/features/notification/domain/get_notification.dart';

class GetNotificationController {
  final GetNotification notification;

  GetNotificationController({required this.notification});

  void onTimeChanged(TimeOfDay time) {
    notification.notificationTime = time;
  }
}
