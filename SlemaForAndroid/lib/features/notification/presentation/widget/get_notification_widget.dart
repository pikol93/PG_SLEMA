import 'package:flutter/material.dart';
import 'package:pg_slema/custom_icons_icons.dart';
import 'package:pg_slema/features/notification/logic/entity/get_notification.dart';
import 'package:pg_slema/features/notification/presentation/controller/get_notification_controller.dart';
import 'package:pg_slema/features/notification/presentation/controller/time_picker_controller.dart';
import 'package:pg_slema/features/notification/presentation/widget/time_picker.dart';

class GetNotificationWidget extends StatefulWidget {
  final GetNotificationController controller;
  final ValueChanged<GetNotification> onNotificationChanged;
  final ValueSetter<GetNotification> onNotificationDeleted;

  const GetNotificationWidget(
      {super.key,
      required this.onNotificationChanged,
      required this.onNotificationDeleted,
      required this.controller});

  @override
  State<StatefulWidget> createState() => _GetNotificationWidgetState();
}

class _GetNotificationWidgetState extends State<GetNotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomTimePicker(
              onTimeChanged: onTimeChanged,
              controller: TimePickerController(
                  widget.controller.notification.notificationTime),
            ),
          ),
          IconButton(
            onPressed: onDeleteClicked,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              iconSize: MaterialStateProperty.all(26),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              iconColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
            ),
            icon: const Icon(
              CustomIcons.remove_circle,
            ),
          )
        ],
      ),
    );
  }

  void onTimeChanged(TimeOfDay time) {
    widget.controller.onTimeChanged(time);
    widget.onNotificationChanged(widget.controller.notification);
  }

  void onDeleteClicked() {
    widget.onNotificationDeleted(widget.controller.notification);
  }
}
