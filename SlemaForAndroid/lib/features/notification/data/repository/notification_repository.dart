import 'package:pg_slema/features/notification/domain/notification.dart';

abstract class NotificationRepository {
  Future<List<Notification>> getAllNotificationsByMedicine(String medicineId);

  Future<List<Notification>> getAllNotifications();

  Future addNotification(Notification notification);

  Future updateNotification(Notification notification);

  Future deleteNotification(Notification notification);

  Future deleteAll(List<Notification> notifications);
}
