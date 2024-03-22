import 'package:flutter/material.dart';
import 'package:pg_slema/custom_icons_icons.dart';

import 'package:pg_slema/features/picture/presentation/controller/take_picture_controller.dart';

class TakePicture extends StatefulWidget {
  /*
  TODO UWAGA, TEN WIDGET ZAPISUJE ZROBIONE ZDJECIE TYLKO DO FOLDERU CACHE
  PO WYLACZENIU APKI TRACIMY ZDJECIE, A WPIS W SHAREDPREFERENCES ZOSTAJE.
   */
  final VoidCallback voidCallbackAfterAddedImage;
  final TakePictureController takePictureController;
  const TakePicture(
      {super.key,
      required this.voidCallbackAfterAddedImage,
      required this.takePictureController});

  @override
  State<TakePicture> createState() => _TakePictureState();
}

class _TakePictureState extends State<TakePicture> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await widget.takePictureController.takePicture();
        widget.voidCallbackAfterAddedImage();
      },
      icon: const Icon(CustomIcons.photo),
    );
  }
}
