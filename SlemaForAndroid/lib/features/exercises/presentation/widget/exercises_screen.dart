import 'package:flutter/material.dart';
import 'package:pg_slema/features/picture/presentation/controller/picture_controller.dart';
import 'package:pg_slema/features/picture/presentation/widget/pick_image.dart';
import 'package:pg_slema/features/picture/presentation/widget/preview_picture.dart';
import 'package:pg_slema/features/picture/presentation/widget/take_picture_button.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercise_widget.dart';
import 'package:provider/provider.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  ExercisesScreenState createState() => ExercisesScreenState();
}

class ExercisesScreenState extends State<ExercisesScreen> {
  late PictureController pictureController;

  @override
  void initState() {
    super.initState();
    pictureController = PictureController();
    pictureController.addListener(() {
      setState(() {}); //Reload after taking a picture.
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => pictureController,
        builder: (context, child) {
          return Scaffold(
            body: Stack(
              children: [
                ListView(
                  children: [
                    const ExerciseWidget(
                        exerciseName: "Podciąganie",
                        series: "1/3",
                        repetitions: "5",
                        weight: "-15kg"),
                    const SizedBox(
                      height: 10,
                    ),
                    const ExerciseWidget(
                        exerciseName: "Brzuszki",
                        series: "3/7",
                        repetitions: "15",
                        weight: "+5kg"),
                    PickImage(),
                    PreviewPicture(
                      picture: pictureController.picture,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  right: 30,
                  child: Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.edit_calendar, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
