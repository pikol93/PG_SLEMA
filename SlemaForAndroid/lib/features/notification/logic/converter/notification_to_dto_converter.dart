import 'package:pg_slema/features/notification/logic/entity/notification_dto.dart';
import 'package:pg_slema/features/notification/logic/entity/notification.dart';

class NotificationToDtoConverter {
  static Notification fromDto(NotificationDto dto) {
    return Notification(
        dto.id,
        dto.ownerId,
        dto.title,
        dto.body,
        dto.notificationTime,
        dto.firstNotificationDate,
        dto.lastNotificationDate,
        dto.notificationFrequency,
        dto.scheduledId,
        dto.delayBetweenIntakes);
  }

  static NotificationDto toDto(Notification notification) {
    return NotificationDto(
        notification.id,
        notification.ownerId,
        notification.title,
        notification.body,
        notification.notificationTime,
        notification.firstNotificationDate,
        notification.lastNotificationDate,
        notification.notificationFrequency,
        notification.scheduledId,
        notification.delayBetweenIntakes);
  }
}
