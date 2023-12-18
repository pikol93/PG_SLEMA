import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/notification/domain/get_notification.dart';

class ManageNotificationsWidget extends StatefulWidget {
  final ValueChanged<GetNotification> onNotificationChanged;
  final ValueSetter<GetNotification> onNotificationDeleted;
  final ValueSetter<GetNotification> onNotificationCreated;

  const ManageNotificationsWidget(
      {super.key,
      required this.onNotificationChanged,
      required this.onNotificationDeleted,
      required this.onNotificationCreated});

  @override
  State<ManageNotificationsWidget> createState() =>
      _ManageNotificationsWidgetState();
}

class _ManageNotificationsWidgetState extends State<ManageNotificationsWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("todo");
  }
}
