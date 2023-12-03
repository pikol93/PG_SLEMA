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
    //TODO: make it schedulable
  }

  void deleteNotification(Notification notification) {
    repository.deleteNotification(notification);
    //TODO: remove scheduling it
  }

  void updateNotification(Notification notification) {
    repository.updateNotification(notification);
    //TODO: remove scheduling it
    //TODO: make it schedulable again
  }
}
