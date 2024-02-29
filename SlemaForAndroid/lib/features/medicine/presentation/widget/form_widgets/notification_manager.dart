import 'package:flutter/material.dart';

class NotificationManager extends StatefulWidget {
  final bool switchValue;
  final ValueChanged<bool> onChanged;
  const NotificationManager({
    super.key,
    required this.switchValue,
    required this.onChanged,
  });

  @override
  NotificationManagerState createState() => NotificationManagerState();
}

class NotificationManagerState extends State<NotificationManager> {
  bool notificationAvailable = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: [
        Text(
          "Powiadomienia",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Transform.scale(
              scale: 1.2,
              child: Switch(
                value: widget.switchValue,
                onChanged: widget.onChanged,
              ),
            ),
          ),
        )
      ],
    );
  }
}
