import 'package:flutter/material.dart';
import 'package:pg_slema/features/notification/logic/entity/get_notification.dart';
import 'package:uuid/uuid.dart';

class CreateNotificationButton extends StatelessWidget {
  final ValueSetter<GetNotification> onNotificationCreated;

  const CreateNotificationButton(
      {super.key, required this.onNotificationCreated});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onNotificationCreated(
            GetNotification(const Uuid().v4(), TimeOfDay.now())),
        child: const Text("Dodaj nowe powiadomienie"));
  }
}
