class MedicineDto {
  static String medicineListSharedPrefKey = 'medicines';
  final String id;
  final String name;
  final String intakeType;

  MedicineDto(this.id, this.name, this.intakeType);
}
