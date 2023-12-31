import 'package:pg_slema/features/notification/data/notification_dto.dart';
import 'package:pg_slema/features/notification/domain/notification.dart';

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
        dto.scheduledId);
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
        notification.scheduledId);
  }
}
