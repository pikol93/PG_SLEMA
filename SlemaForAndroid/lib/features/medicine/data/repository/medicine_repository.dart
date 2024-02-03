import 'package:pg_slema/features/medicine/domain/medicine.dart';

mixin MedicineRepository {
  Future<List<Medicine>> getAllMedicines();

  Future addMedicine(Medicine medicine);

  Future updateMedicine(Medicine medicine);

  Future deleteMedicine(String id);
}
