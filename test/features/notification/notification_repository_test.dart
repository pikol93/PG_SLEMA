import 'package:flutter_test/flutter_test.dart';
import 'package:pg_slema/features/medicine/data/repository/notification_repository.dart';
import 'package:pg_slema/features/medicine/data/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart';
import 'package:flutter/material.dart' as mat;
import 'package:uuid/uuid.dart';

class NotificationRepositoryTest {
  final NotificationRepository repository =
      SharedPreferencesNotificationRepository();

  void shouldDeleteNotificationWhenDeletedNotificationExists() {
    const uuid = Uuid();
    var notification = Notification(
        uuid.v4(),
        const mat.TimeOfDay(hour: 1, minute: 1),
        DateTime(2000),
        DateTime(2000),
        Frequency.daily);
    repository.addNotification(notification)
    repository.deleteNotification(notification);
    expect(0, repository.getAllNotifications().length);
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

void main() {
  final repositoryTest = NotificationRepositoryTest();
  test("", () => repositoryTest.shouldDeleteNotificationWhenDeletedNotificationExists());
  test("", () => repositoryTest.shouldNotDoAnythingWhenDeletedNotificationDoesNotExist());
}
