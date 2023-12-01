import 'package:pg_slema/features/medicine/data/repository/notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/medicine.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart';

class SharedPreferencesNotificationRepository implements NotificationRepository {
  @override
  List<Notification> getAllNotificationsOfMedicine(Medicine medicine) {
    return List<Notification>.empty();
    // TODO: implement getAllNotificationsOfMedicine
  }

  @override
  void deleteNotification(Notification notification) {
    // TODO: implement deleteNotification
  }

  @override
  void addNotification(Notification notification) {
    // TODO: implement addNotification
  }

  @override
  void updateNotification(Notification notification) {
    // TODO: implement updateNotification
  }
}