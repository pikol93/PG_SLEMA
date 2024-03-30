import 'package:pg_slema/features/exercises/logic/converter/exercise_to_dto_converter.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';
import 'package:pg_slema/features/exercises/logic/repository/shared_preferences_exercise_repository.dart';
import 'package:pg_slema/features/exercises/logic/service/exercise_service.dart';

class AllExercisesController {
  late List<Exercise> exercises;
  late final ExerciseService exerciseService;
  final Function onExercisesChanged;

  AllExercisesController(this.onExercisesChanged) : super() {
    exercises = List.empty();
    var converter = ExerciseToDtoConverter();
    var repository = SharedPreferencesExerciseRepository(converter);
    exerciseService = ExerciseService(repository);
  }

  void initializeExercises() async {
    exercises = await exerciseService.getAllExercises();
    onExercisesChanged();
  }

  Future onExerciseCreated(Exercise exercise) async {
    exercises.add(exercise);
    onExercisesChanged();
    await exerciseService.addExercise(exercise);
  }

  Future onExerciseUpdated(Exercise exercise) async {
    final index = exercises.indexWhere((e) => e.id == exercise.id);
    exercises[index] = exercise;
    onExercisesChanged();
    await exerciseService.updateExercise(exercise);
  }

  Future onExerciseDeleted(String id) async {
    exercises.removeWhere((element) => element.id == id);
    onExercisesChanged();
    await exerciseService.deleteExercise(id);
  }
}
