import 'package:pg_slema/features/medicine/application/service/notification_scheduling_service.dart';
import 'package:pg_slema/features/medicine/data/repository/notification_repository.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart';

class NotificationService {
  final NotificationRepository repository;

  final NotificationSchedulingService schedulingService =
      NotificationSchedulingService();

  NotificationService(this.repository) {
    schedulingService.initNotifications();
  }

  void addNotification(Notification notification) {
    repository.addNotification(notification);
    schedulingService.scheduleNotification(notification);
  }

  void deleteNotification(Notification notification) {
    schedulingService.cancelNotification(notification);
    repository.deleteNotification(notification);
  }

  void updateNotification(Notification notification) {
    schedulingService.cancelNotification(notification);
    repository.updateNotification(notification);
    schedulingService.scheduleNotification(notification);
  }

  Future<List<Notification>> getAllNotificationsByMedicine(
      String medicineId) async {
    return await repository.getAllNotificationsByMedicine(medicineId);
  }
}
