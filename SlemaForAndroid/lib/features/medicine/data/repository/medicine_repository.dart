import 'package:pg_slema/features/medicine/domain/medicine.dart';

abstract class MedicineRepository {
  Future<List<Medicine>> getAllMedicines();

  Future addMedicine(Medicine medicine);

  Future updateMedicine(Medicine medicine);

  Future deleteMedicine(Medicine medicine);
}
