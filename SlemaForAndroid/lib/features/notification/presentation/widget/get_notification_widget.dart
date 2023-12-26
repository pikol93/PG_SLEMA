import 'package:flutter/material.dart';
import 'package:pg_slema/features/notification/domain/get_notification.dart';
import 'package:pg_slema/features/notification/presentation/controller/get_notification_controller.dart';
import 'package:pg_slema/features/notification/presentation/widget/time_picker.dart';

class GetNotificationWidget extends StatefulWidget {
  final controller = GetNotificationController();
  final ValueChanged<GetNotification> onNotificationChanged;
  final ValueSetter<GetNotification> onNotificationDeleted;

  GetNotificationWidget(
      {super.key,
      required this.onNotificationChanged,
      required this.onNotificationDeleted,
      required ValueSetter<GetNotification> onNotificationCreated}) {
    onNotificationCreated(controller.notification);
  }

  @override
  State<StatefulWidget> createState() => _GetNotificationWidgetState();
}

class _GetNotificationWidgetState extends State<GetNotificationWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build : row with time picker(changed) and delete button(deleted)
    return CustomTimePicker(onTimeChanged: onTimeChanged);
  }

  void onTimeChanged(TimeOfDay time) {
    widget.controller.onTimeChanged(time);
    widget.onNotificationChanged(widget.controller.notification);
  }
}
