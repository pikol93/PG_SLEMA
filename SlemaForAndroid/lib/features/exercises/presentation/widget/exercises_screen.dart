import 'package:flutter/material.dart';
import 'package:pg_slema/features/exercises/presentation/widget/exercise_widget.dart';
import 'package:pg_slema/features/photo/presentation/provider/camera_provider.dart';
import 'package:pg_slema/features/photo/presentation/widget/take_picture_screen.dart';
import 'package:provider/provider.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  ExercisesScreenState createState() => ExercisesScreenState();
}

class ExercisesScreenState extends State<ExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    final cameraController = Provider.of<CameraProvider>(context);
    return TakePictureScreen(camera: cameraController.cameraDescription);
  }
}
