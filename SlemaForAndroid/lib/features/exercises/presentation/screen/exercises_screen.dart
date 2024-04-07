import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/logic/service/exercise_service.dart';
import 'package:pg_slema/features/exercises/presentation/controller/exercises_controller.dart';
import 'package:pg_slema/features/exercises/presentation/screen/add_exercise_screen.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercise_widget.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
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
        builder: (context) => AddExerciseScreen(
          onExerciseAdded: _controller.onExerciseCreated,
        ),
      ),
    );
  }

  void _onExercisesChanged() {
    setState(() {});
  }
}
