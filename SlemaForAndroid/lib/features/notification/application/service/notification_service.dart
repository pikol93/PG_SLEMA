import 'package:pg_slema/features/notification/application/service/notification_scheduling_service.dart';
import 'package:pg_slema/features/notification/data/repository/notification_repository.dart';
import 'package:pg_slema/features/notification/domain/notification.dart';

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
    Future.forEach(notifications, schedulingService.cancelNotification);
  }

  Future<List<Notification>> getAllNotifications() async {
    return await repository.getAllNotifications();
  }
}
