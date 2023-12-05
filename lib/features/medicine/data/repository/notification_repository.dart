import 'package:pg_slema/features/medicine/domain/medicine.dart';

import 'package:pg_slema/features/medicine/domain/notification.dart';

abstract class NotificationRepository {
  List<Notification> getAllNotificationsOfMedicine(String medicineId);

  Future<List<Notification>> getAllNotifications();

  Future addNotification(Notification notification);

  Future updateNotification(Notification notification);

  Future deleteNotification(Notification notification);
}
