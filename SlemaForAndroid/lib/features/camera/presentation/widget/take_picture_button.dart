import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:pg_slema/features/camera/presentation/widget/take_picture_screen.dart';
import 'package:provider/provider.dart';

import 'package:pg_slema/features/camera/presentation/controller/picture_controller.dart';

class TakePictureButton extends StatefulWidget {
  const TakePictureButton({super.key});

  @override
  State<TakePictureButton> createState() => _TakePictureButtonState();
}

class _TakePictureButtonState extends State<TakePictureButton> {
  late PictureController _pictureController;

  Future<void> getFirstCameraAndOpenCameraView(BuildContext context) async {
    availableCameras().then((value) => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => TakePictureScreen(
                  cameras: value,
                  pictureController: _pictureController,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    _pictureController = Provider.of<PictureController>(context);
    return ElevatedButton(
      onPressed: () async {
        await getFirstCameraAndOpenCameraView(context);
      },
      child: const Text("Take a Picture"),
    );
  }
}
