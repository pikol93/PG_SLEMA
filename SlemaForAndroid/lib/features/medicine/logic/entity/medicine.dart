import 'package:pg_slema/features/notification/logic/entity/notification.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';

class Medicine {
  static const String medicineListSharedPrefKey = 'medicines';
  final String id;
  final String name;
  final DateTime firstIntakeDate;
  final DateTime lastIntakeDate;
  final Frequency intakeFrequency;
  final List<Notification> notifications;
  final int delayBetweenIntakes;
  final String dose;
  final String intakeType;
  final String opinion;
  final String medicineType;

  Medicine(this.id, this.name, this.firstIntakeDate, this.lastIntakeDate,
      this.intakeFrequency, this.notifications, this.delayBetweenIntakes,
      this.dose, this.intakeType, this.opinion, this.medicineType);

  @override
  String toString() {
    return 'Medicine{id: $id, name: $name, intakeType: $intakeType, '
        'firstIntakeDate: $firstIntakeDate, lastIntakeDate: $lastIntakeDate, '
        'intakeFrequency: $intakeFrequency}, numberOfNotifications: ${notifications.length}';
  }
}
