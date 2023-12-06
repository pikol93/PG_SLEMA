import 'package:pg_slema/features/medicine/data/dto/notification_dto.dart';
import 'package:pg_slema/features/medicine/domain/notification.dart';

class NotificationToDtoConverter {
  static Notification fromDto(NotificationDto dto) {
    return Notification(
        dto.id,
        dto.medicineId,
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
        notification.medicineId,
        notification.title,
        notification.body,
        notification.notificationTime,
        notification.firstNotificationDate,
        notification.lastNotificationDate,
        notification.notificationFrequency,
        notification.scheduledId);
  }
}
