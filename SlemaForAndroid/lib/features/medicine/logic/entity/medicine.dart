import 'package:pg_slema/features/notification/logic/entity/notification.dart';
import 'package:pg_slema/utils/frequency/frequency.dart';

class Medicine {
  static const String medicineListSharedPrefKey = 'medicines';
  final String id;
  final String name;
  final DateTime intakeDate;
  final Frequency intakeFrequency;
  final List<Notification> notifications;
  final String dose;
  final String intakeType;
  final String opinion;
  final String medicineType;

  Medicine(
      this.id,
      this.name,
      this.intakeDate,
      this.intakeFrequency,
      this.notifications,
      this.dose,
      this.intakeType,
      this.opinion,
      this.medicineType);

  @override
  String toString() {
    return 'Medicine{id: $id, name: $name, intakeType: $intakeType, '
        'intakeDate: $intakeDate,'
        'intakeFrequency: $intakeFrequency}, numberOfNotifications: ${notifications.length}';
  }
}
