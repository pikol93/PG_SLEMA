import 'package:flutter/material.dart';
import 'package:pg_slema/features/notification/logic/entity/get_notification.dart';
import 'package:pg_slema/features/notification/presentation/controller/get_notification_controller.dart';
import 'package:pg_slema/features/notification/presentation/controller/manage_notifications_controller.dart';
import 'package:pg_slema/features/notification/presentation/widget/create_notification_button.dart';
import 'package:pg_slema/features/notification/presentation/widget/get_notification_widget.dart';
import 'package:pg_slema/features/notification/presentation/widget/general_container.dart';

class ManageNotificationsTimeWidget extends StatefulWidget {
  final ManageNotificationsController controller;

  const ManageNotificationsTimeWidget({super.key, required this.controller});

  @override
  State<ManageNotificationsTimeWidget> createState() =>
      _ManageNotificationsTimeWidgetState();
}

class _ManageNotificationsTimeWidgetState
    extends State<ManageNotificationsTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return GeneralContainer(
      label: 'Godziny',
      child: Column(
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
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                child: GetNotificationWidget(
                  onNotificationChanged:
                      widget.controller.onNotificationChanged, //update?
                  onNotificationDeleted: onNotificationDeleted,
                  controller:
                      GetNotificationController(notification: notification),
                ),
              );
            },
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CreateNotificationButton(
              onNotificationCreated: onNotificationCreated,
            ),
          )
        ],
      ),
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
