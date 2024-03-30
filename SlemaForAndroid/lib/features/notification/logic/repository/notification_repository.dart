import 'package:pg_slema/features/notification/logic/entity/notification.dart';

mixin NotificationRepository {
  Future<List<Notification>> getAllNotificationsByMedicine(String medicineId);

  Future<List<Notification>> getAllNotifications();

  Future addNotification(Notification notification);

  Future updateNotification(Notification notification);

  Future deleteNotification(String id);

  Future deleteAll(List<String> id);

  Future addMultipleNotifications(List<Notification> notifications);
}
