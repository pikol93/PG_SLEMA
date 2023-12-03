import 'package:flutter_test/flutter_test.dart';
import 'package:pg_slema/features/medicine/data/repository/notification_repository.dart';
import 'package:pg_slema/features/medicine/data/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart';
import 'package:flutter/material.dart' as mat;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class NotificationRepositoryTest {
  final NotificationRepository repository;

  NotificationRepositoryTest(this.repository);

  void shouldDeleteNotificationWhenDeletedNotificationExists() async {
    const uuid = Uuid();
    var notification = Notification(
        uuid.v4(),
        const mat.TimeOfDay(hour: 1, minute: 1),
        DateTime(2000),
        DateTime(2000),
        Frequency.daily);
    repository.addNotification(notification);
    repository.deleteNotification(notification);
    final notifications = await repository.getAllNotifications();
    expect(0, notifications.length);
  }

  void shouldNotDoAnythingWhenDeletedNotificationDoesNotExist() {
    const uuid = Uuid();
    var notification = Notification(
        uuid.v4(),
        const mat.TimeOfDay(hour: 1, minute: 1),
        DateTime(2000),
        DateTime(2000),
        Frequency.daily);
    repository.deleteNotification(notification);
  }
}

void main() async {
  NotificationRepository repo = SharedPreferencesNotificationRepository(await SharedPreferences.getInstance());
  final repositoryTest = NotificationRepositoryTest(repo);
  test(
      "shouldDeleteNotificationWhenDeletedNotificationExists",
      () => repositoryTest
          .shouldDeleteNotificationWhenDeletedNotificationExists());
  test(
      "shouldNotDoAnythingWhenDeletedNotificationDoesNotExist",
      () => repositoryTest
          .shouldNotDoAnythingWhenDeletedNotificationDoesNotExist());
}
