import 'package:pg_slema/features/medicine/domain/notification.dart';

abstract class NotificationRepository {
  Future<List<Notification>> getAllNotificationsByMedicine(String medicineId);

  Future<List<Notification>> getAllNotifications();

  Future addNotification(Notification notification);

  Future updateNotification(Notification notification);

  Future deleteNotification(Notification notification);
}
