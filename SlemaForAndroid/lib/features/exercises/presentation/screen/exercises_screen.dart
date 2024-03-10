import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/exercises/presentation/controller/exercises_controller.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercise_widget.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<StatefulWidget> createState() => ExercisesScreenState();
}

class ExercisesScreenState extends State<ExercisesScreen> {
  late final AllExercisesController _controller;

  ExercisesScreenState() {
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
