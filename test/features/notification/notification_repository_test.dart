import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pg_slema/features/medicine/data/repository/notification_repository.dart';
import 'package:pg_slema/features/medicine/data/repository/shared_preferences_notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart';
import 'package:flutter/material.dart' as mat;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
import 'notification_repository_test.mocks.dart';

class NotificationRepositoryTest {
  final NotificationRepository repository;

  NotificationRepositoryTest(this.repository);

  void shouldDeleteNotificationWhenDeletedNotificationExists() async {
    const uuid = Uuid();
    var notification = Notification(
        uuid.v4(),
        '',
        '',
        const mat.TimeOfDay(hour: 1, minute: 1),
        DateTime(2000),
        DateTime(2000),
        Frequency.daily);
    await repository.addNotification(notification);
    await repository.deleteNotification(notification);
    final notifications = await repository.getAllNotifications();
    expect(notifications.length, 0);
  }

  void shouldNotDoAnythingWhenDeletedNotificationDoesNotExist() async {
    const uuid = Uuid();
    var notification = Notification(
        uuid.v4(),
        '',
        '',
        const mat.TimeOfDay(hour: 1, minute: 1),
        DateTime(2000),
        DateTime(2000),
        Frequency.daily);
    await repository.deleteNotification(notification);
    final notifications = await repository.getAllNotifications();
    expect(notifications.length, 0);
  }

  void shouldAddNotificationWhenAddNotificationIsExecuted() async {
    const uuid = Uuid();
    var notification = Notification(
        uuid.v4(),
        '',
        '',
        const mat.TimeOfDay(hour: 1, minute: 1),
        DateTime(2000),
        DateTime(2000),
        Frequency.daily);
    await repository.addNotification(notification);
    final notifications = await repository.getAllNotifications();
    expect(notifications.length, 1);
  }

  void
      shouldOverrideNotificationWhenAddNotificationIsExecutedAndNotificationWithSameUUIDExists() async {
    const uuid = Uuid();
    String id = uuid.v4();
    var notification = Notification(
        id,
        '',
        '',
        const mat.TimeOfDay(hour: 1, minute: 1),
        DateTime(2000),
        DateTime(2000),
        Frequency.daily);
    await repository.addNotification(notification);
    notification = Notification(
        id,
        '',
        '',
        const mat.TimeOfDay(hour: 1, minute: 1),
        DateTime(2000),
        DateTime(2000),
        Frequency.everyTwoDays);
    await repository.addNotification(notification);
    final notifications = await repository.getAllNotifications();
    expect(notifications.length, 1);
    expect(notifications[0].notificationFrequency, Frequency.everyTwoDays);
  }
}

void main() {
  SharedPreferences preferences = MockSharedPreferences();
  NotificationRepository repo =
      SharedPreferencesNotificationRepository(preferences);
  final repositoryTest = NotificationRepositoryTest(repo);
  test("shouldDeleteNotificationWhenDeletedNotificationExists", () {
    List<String> notificationsList = List<String>.empty(growable: true);
    when(preferences.getStringList(Notification.notificationListSharedPrefKey))
        .thenReturn(notificationsList);
    //TODO: mock setter
    repositoryTest.shouldDeleteNotificationWhenDeletedNotificationExists();
  });
  test("shouldNotDoAnythingWhenDeletedNotificationDoesNotExist", () {
    reset(preferences);
    when(preferences.getStringList(Notification.notificationListSharedPrefKey))
        .thenReturn(List<String>.empty(growable: true));
    repositoryTest.shouldNotDoAnythingWhenDeletedNotificationDoesNotExist();
  });
}
