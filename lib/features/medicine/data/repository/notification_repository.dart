import 'package:pg_slema/features/medicine/domain/medicine.dart';

import 'package:pg_slema/features/medicine/domain/notification.dart';

abstract class NotificationRepository {
  List<Notification> getAllNotificationsOfMedicine(Medicine medicine);

  List<Notification> getAllNotifications();

  void addNotification(Notification notification);

  void updateNotification(Notification notification);

  void deleteNotification(Notification notification);
}
