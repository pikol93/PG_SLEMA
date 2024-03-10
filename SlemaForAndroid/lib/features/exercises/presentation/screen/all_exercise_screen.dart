import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/exercises/presentation/controller/all_exercises_controller.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercise_widget.dart';

class AllExerciseScreen extends StatefulWidget {
  const AllExerciseScreen({super.key});

  @override
  State<StatefulWidget> createState() => AllExerciseScreenState();
}

class AllExerciseScreenState extends State<AllExerciseScreen> {
  late final AllExercisesController _controller;

  AllExerciseScreenState() {
    _controller = AllExercisesController(_onExercisesChanged);
    super.initState();
    _controller.initializeExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ExerciseWidget(
                          exercise: _controller.exercises.elementAt(index))
                      .build(context);
                },
                childCount: _controller.exercises.length,
              ),
            ),
          ],
        );
      },
    );
  }

  void _onExercisesChanged() {
    setState(() {});
  }
}
