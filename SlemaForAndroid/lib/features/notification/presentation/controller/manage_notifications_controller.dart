import 'package:pg_slema/features/notification/logic/entity/get_notification.dart';

mixin ManageNotificationsController {
  get notifications;
  void onNotificationDeleted(GetNotification notification);
  void onNotificationChanged(GetNotification notification);
  void onNotificationCreated(GetNotification notification);
}
