import 'package:pg_slema/features/notification/logic/service/notification_scheduling_service.dart';
import 'package:pg_slema/features/notification/logic/service/notification_service.dart';
import 'package:pg_slema/initializers/initializer.dart';

class NotificationsInitializer with Initializer {
  final NotificationService _notificationService;

  final NotificationSchedulingService _schedulingService;

  NotificationsInitializer(this._notificationService, this._schedulingService);

  @override
  Future initialize() async {
    var notifications = await _notificationService.getAllNotifications();
    for (var notification in notifications) {
      _schedulingService.cancelNotification(notification);
      _schedulingService.scheduleNotification(notification);
    }
  }
}
