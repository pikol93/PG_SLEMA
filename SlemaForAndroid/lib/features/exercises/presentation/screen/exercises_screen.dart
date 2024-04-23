import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/service/exercise_service.dart';
import 'package:pg_slema/features/exercises/presentation/controller/exercises_controller.dart';
import 'package:pg_slema/features/exercises/presentation/screen/exercise_screen.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercise_widget.dart';
import 'package:pg_slema/utils/widgets/appbars/white_app_bar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';
import 'package:pg_slema/utils/widgets/default_floating_action_button/default_floating_action_button.dart';

class ExercisesScreen extends StatefulWidget {
  final ExerciseService service;

  const ExercisesScreen({
    super.key,
    required this.service,
  });

  @override
  State<StatefulWidget> createState() => ExercisesScreenState();
}

class ExercisesScreenState extends State<ExercisesScreen> {
  late AllExercisesController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AllExercisesController(
      exerciseService: widget.service,
      onExercisesChanged: _onExercisesChanged,
    );
    _controller.initializeExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 20.0),
      const WhiteAppBar(titleText: "Ćwiczenia"),
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
                        exercise: _controller.exercises.elementAt(index),
                        controller: _controller,
                      );
                    },
                  ),
                ),
              ],
            ),
            DefaultFloatingActionButton(
                onPressed: _openAddExerciseScreen, child: const Icon(Icons.add))
          ],
        ),
      ),
    ]);
  }

  void _openAddExerciseScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExerciseScreen(
          onExerciseAdded: _controller.onExerciseCreated,
        ),
      ),
    );
  }

  void _onExercisesChanged() {
    setState(() {});
  }
}
