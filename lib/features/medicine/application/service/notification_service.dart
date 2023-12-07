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

  Future addNotification(Notification notification) async {
    await schedulingService.scheduleNotification(notification);
    await repository.addNotification(notification);
  }

  Future deleteNotification(Notification notification) async {
    await repository.deleteNotification(notification);
    await schedulingService.cancelNotification(notification);
  }

  Future updateNotification(Notification notification) async {
    await schedulingService.cancelNotification(notification);
    await schedulingService.scheduleNotification(notification);
    await repository.updateNotification(notification);
  }

  Future<List<Notification>> getAllNotificationsByMedicine(
      String medicineId) async {
    return await repository.getAllNotificationsByMedicine(medicineId);
  }

  Future deleteNotificationsByMedicine(String medicineId) async {
    var notifications =
        await repository.getAllNotificationsByMedicine(medicineId);
    await repository.deleteAll(notifications);
  }
}
