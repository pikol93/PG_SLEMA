import 'package:pg_slema/features/exercises/logic/converter/exercise_dto_to_json_converter.dart';
import 'package:pg_slema/features/exercises/logic/converter/exercise_to_dto_converter.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise_dto.dart';
import 'package:pg_slema/features/exercises/logic/repository/exercise_repository.dart';
import 'package:pg_slema/utils/data/shared_preferences_crud_repository.dart';

class SharedPreferencesExerciseRepository
    extends SharedPreferencesCrudRepository<ExerciseDto>
    with ExerciseRepository {
  final ExerciseToDtoConverter exerciseConverter;

  SharedPreferencesExerciseRepository(this.exerciseConverter)
      : super(ExerciseDtoToJsonConverter(), Exercise.exerciseListSharedPrefKey);

  @override
  Future addExercise(Exercise exercise) async {
    final dto = exerciseConverter.toDto(exercise);
    await addDto(dto);
  }

  @override
  Future deleteExercise(String id) async {
    await deleteDto(id);
  }

  @override
  Future<List<Exercise>> getAllExercises() async {
    var dto = await getAllDto();
    return dto.map((e) => exerciseConverter.fromDto(e)).toList(growable: true);
  }

  @override
  Future<Exercise> getExercise(String id) async {
    var dto = await getDto(id);
    return exerciseConverter.fromDto(dto);
  }

  @override
  Future updateExercise(Exercise exercise) async {
    final dto = exerciseConverter.toDto(exercise);
    await updateDto(dto);
  }

  @override
  Future deleteAllExercises() async {
    final dtoList = await getAllDto();
    final ids = dtoList.map((e) => e.id).toList(growable: false);
    await deleteAllFrom(ids);
  }
}
