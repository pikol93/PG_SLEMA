import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class PreviewPicture extends StatefulWidget {
  const PreviewPicture({super.key, required this.picture});

  final XFile? picture;

  @override
  State<PreviewPicture> createState() => _PreviewPictureState();
}

class _PreviewPictureState extends State<PreviewPicture> {
  @override
  Widget build(BuildContext context) {
    if (widget.picture != null) {
      return Column(mainAxisSize: MainAxisSize.min, children: [
        Image.file(File(widget.picture!.path), fit: BoxFit.cover, width: 250),
        const SizedBox(height: 24),
        Text(widget.picture!.name)
      ]);
    } else {
      return Container(
        height: 200,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      );
    }
  }
}
