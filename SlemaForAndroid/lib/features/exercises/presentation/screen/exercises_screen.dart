import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/presentation/controller/exercises_controller.dart';
import 'package:pg_slema/features/exercises/presentation/screen/add_exercise_screen.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercise_widget.dart';
import 'package:pg_slema/utils/widgets/default_appbar/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/default_floating_action_button/default_floating_action_button.dart';

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

  void openAddExerciseScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddExerciseScreen(
          onExerciseAdded: _controller.onExerciseCreated,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const DefaultAppBar(title: "Ćwiczenia"),
      Expanded(
        child: Stack(
          children: [
            Flex(
              direction: Axis.vertical,
              children: [
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
                ),
              ],
            ),
            DefaultFloatingActionButton(
                onPressed: openAddExerciseScreen, child: const Icon(Icons.add))
          ],
        ),
      ),
    ]);
  }

  void _onExercisesChanged() {
    setState(() {});
  }
}
