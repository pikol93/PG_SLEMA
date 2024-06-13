import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pg_slema/features/gallery/logic/entity/image_metadata.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/utils/widgets/appbars/default_appbar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body.dart';

class ImageScreen extends StatelessWidget with Logger {
  final ImageMetadata metadata;
  late final Future<Uint8List> future;

  ImageScreen({
    super.key,
    required this.metadata,
  }) {
    future = File(metadata.filename).readAsBytes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DefaultAppBar(title: "Zdjęcie"),
        DefaultBody(
          mainWidgetsPaddingHorizontal: 0.0,
          child: FutureBuilder(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const CircularProgressIndicator();
              }
              final data = snapshot.data!;
              logger.debug("Data: ${data.lengthInBytes}");

              final image = Image.memory(
                data,
                fit: BoxFit.fitWidth,
              );
              return InteractiveViewer(
                minScale: 0.01,
                maxScale: 10.0,
                child: image,
              );
            },
          ),
        ),
      ],
    );
  }
}
