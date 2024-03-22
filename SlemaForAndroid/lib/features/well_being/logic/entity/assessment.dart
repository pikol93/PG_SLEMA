class Assessment {
  static const String medicineListSharedPrefKey = 'assessments';

  final int id;
  final DateTime intakeDate;

  Assessment({required this.id, required this.intakeDate});
}
