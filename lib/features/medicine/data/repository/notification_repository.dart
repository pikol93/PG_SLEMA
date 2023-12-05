import 'package:pg_slema/features/medicine/domain/notification.dart';

abstract class NotificationRepository {
  List<Notification> getAllNotificationsByMedicine(String medicineId);

  List<Notification> getAllNotifications();

  void addNotification(Notification notification);

  void updateNotification(Notification notification);

  void deleteNotification(Notification notification);
}
