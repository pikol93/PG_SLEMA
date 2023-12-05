import 'package:pg_slema/features/medicine/domain/medicine.dart';

abstract class MedicineRepository {
  List<Medicine> getAllMedicines();

  void addMedicine(Medicine medicine);

  void updateMedicine(Medicine medicine);

  void deleteMedicine(Medicine medicine);
}
