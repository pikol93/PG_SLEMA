import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';

mixin ExerciseRepository {
  Future<List<Exercise>> getAllExercises();

  Future<Exercise> getExercise(String id);

  Future addExercise(Exercise exercise);

  Future updateExercise(Exercise exercise);

  Future deleteExercise(String id);

  Future deleteAllExercises();
}
