import 'package:flutter/material.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 4,
            child: CustomTimePicker(
              onTimeChanged: onTimeChanged,
              controller: TimePickerController(
                  widget.controller.notification.notificationTime),
            )),
        Expanded(
          flex: 2,
          child: FilledButton(
            onPressed: onDeleteClicked,
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(0),
                backgroundColor: Theme.of(context).primaryColor),
            child: const Icon(Icons.remove_circle_outline, color: Colors.white),
          ),
        )
      ],
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
