import 'package:pg_slema/features/notification/domain/notification.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';

class Medicine {
  static const String medicineListSharedPrefKey = 'medicines';
  final String id;
  final String name;
  final String intakeType;
  final DateTime firstIntakeDate;
  final DateTime lastIntakeDate;
  final Frequency intakeFrequency;
  final List<Notification> notifications;

  Medicine(this.id, this.name, this.intakeType, this.firstIntakeDate,
      this.lastIntakeDate, this.intakeFrequency, this.notifications);

  @override
  String toString() {
    return 'Medicine{id: $id, name: $name, intakeType: $intakeType, '
        'firstIntakeDate: $firstIntakeDate, lastIntakeDate: $lastIntakeDate, '
        'intakeFrequency: $intakeFrequency}, numberOfNotifications: ${notifications.length}';
  }
}
