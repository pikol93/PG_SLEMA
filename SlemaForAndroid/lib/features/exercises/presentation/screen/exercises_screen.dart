import 'package:flutter/cupertino.dart';
import 'package:pg_slema/features/exercises/presentation/controller/exercises_controller.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercise_widget.dart';
import 'package:pg_slema/utils/widgets/default_appbar/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

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
    return Column(children: [
      const DefaultAppBar(title: "Ćwiczenia"),
      DefaultBody(
        child: ListView.builder(
          itemCount: _controller.exercises.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return ExerciseWidget(
                    exercise: _controller.exercises.elementAt(index))
                .build(context);
          },
        ),
      )
    ]);
  }

  void _onExercisesChanged() {
    setState(() {});
  }
}
