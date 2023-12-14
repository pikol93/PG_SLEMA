import 'package:pg_slema/features/notification/domain/notification.dart';

class Medicine {
  static const String medicineListSharedPrefKey = 'medicines';
  final String id;
  final String name;
  final String intakeType;
  final List<Notification> notifications;

  Medicine(this.id, this.name, this.intakeType, this.notifications);
}