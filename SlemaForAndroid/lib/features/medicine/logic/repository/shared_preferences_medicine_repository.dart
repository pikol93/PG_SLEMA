import 'package:pg_slema/features/medicine/logic/converter/medicine_dto_to_json_converter.dart';
import 'package:pg_slema/features/medicine/logic/converter/medicine_to_dto_converter.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine.dart';
import 'package:pg_slema/features/medicine/logic/entity/medicine_dto.dart';
import 'package:pg_slema/features/medicine/logic/repository/medicine_repository.dart';
import 'package:pg_slema/utils/data/shared_preferences_crud_repository.dart';

class SharedPreferencesMedicineRepository
    extends SharedPreferencesCrudRepository<MedicineDto>
    with MedicineRepository {
  final MedicineToDtoConverter medicineConverter;

  SharedPreferencesMedicineRepository(this.medicineConverter)
      : super(MedicineDtoToJsonConverter(), Medicine.medicineListSharedPrefKey);

  @override
  Future addMedicine(Medicine medicine) async {
    final dto = medicineConverter.toDto(medicine);
    await addDto(dto);
  }

  @override
  Future deleteMedicine(String id) async {
    await deleteDto(id);
  }

  @override
  Future<List<Medicine>> getAllMedicines() async {
    var dto = await getAllDto();
    return Future.wait(
        dto.map((e) => medicineConverter.fromDto(e)).toList(growable: true));
  }

  @override
  Future updateMedicine(Medicine medicine) async {
    final dto = medicineConverter.toDto(medicine);
    await updateDto(dto);
  }
}
