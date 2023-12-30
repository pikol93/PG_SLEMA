import 'package:pg_slema/features/medicine/data/repository/medicine_repository.dart';

import 'package:pg_slema/features/medicine/domain/medicine.dart';

class MedicineService {
  final MedicineRepository _repository;

  MedicineService(this._repository);

  Future<List<Medicine>> getAllMedicines() async {
    return await _repository.getAllMedicines();
  }

  Future addMedicine(Medicine medicine) async {
    await _repository.addMedicine(medicine);
  }

  Future updateMedicine(Medicine medicine) async {
    await _repository.updateMedicine(medicine);
  }

  Future deleteMedicine(Medicine medicine) async {
    await _repository.deleteMedicine(medicine);
  }
}
