import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';
import 'package:pg_slema/features/exercises/logic/service/exercise_service.dart';

class AllExercisesController {
  final ExerciseService exerciseService;
  final Function onExercisesChanged;

  late List<Exercise> exercises;

  AllExercisesController({
    required this.exerciseService,
    required this.onExercisesChanged,
  }) : super() {
    exercises = List.empty();
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
