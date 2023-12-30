import 'package:flutter/material.dart';
import 'package:pg_slema/features/notification/domain/get_notification.dart';
import 'package:pg_slema/features/notification/presentation/controller/get_notification_controller.dart';
import 'package:pg_slema/features/notification/presentation/controller/manage_notifications_controller.dart';
import 'package:pg_slema/features/notification/presentation/widget/create_notification_button.dart';
import 'package:pg_slema/features/notification/presentation/widget/get_notification_widget.dart';

class ManageNotificationsWidget extends StatefulWidget {
  final ManageNotificationsController controller;

  const ManageNotificationsWidget({super.key, required this.controller});

  @override
  State<ManageNotificationsWidget> createState() =>
      _ManageNotificationsWidgetState();
}

class _ManageNotificationsWidgetState extends State<ManageNotificationsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: widget.controller.notifications.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final notification = widget.controller.notifications[index];
            return GetNotificationWidget(
              onNotificationChanged:
                  widget.controller.onNotificationChanged, //update?
              onNotificationDeleted: onNotificationDeleted,
              controller: GetNotificationController(notification: notification),
            );
          },
        )),
        CreateNotificationButton(onNotificationCreated: onNotificationCreated)
      ],
    );
  }

  void onNotificationDeleted(GetNotification notification) {
    widget.controller.onNotificationDeleted(notification);
    setState(() {});
  }

  void onNotificationCreated(GetNotification notification) {
    widget.controller.onNotificationCreated(notification);
    setState(() {});
  }
}
