import 'package:flutter/material.dart';

class GetNotification {
  final String id;
  TimeOfDay notificationTime;

  GetNotification(this.id, this.notificationTime);

  @override
  String toString() {
    return 'Notification{id: $id, notificationTime: $notificationTime}';
  }
}
