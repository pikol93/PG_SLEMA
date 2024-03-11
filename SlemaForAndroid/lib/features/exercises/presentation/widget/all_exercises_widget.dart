import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/exercises/logic/entity/exercise.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercise_widget.dart';

class AllExercisesWidget extends StatelessWidget {
  final List<Exercise> exercises;

  const AllExercisesWidget({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ExerciseWidget(exercise: exercises.elementAt(index))
                      .build(context);
                },
                childCount: exercises.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
