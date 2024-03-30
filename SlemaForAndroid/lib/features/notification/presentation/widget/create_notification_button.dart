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
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).primaryColor,
        ),
        elevation: MaterialStateProperty.all(6),
      ),
      onPressed: () => onNotificationCreated(
        GetNotification(const Uuid().v4(), TimeOfDay.now()),
      ),
      child: Text(
        "Dodaj godzinę przypomnienia",
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
