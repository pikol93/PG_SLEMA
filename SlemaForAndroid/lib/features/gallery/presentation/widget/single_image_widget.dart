import 'package:flutter/material.dart';
import 'package:pg_slema/features/gallery/logic/entity/image_metadata.dart';
import 'package:pg_slema/features/gallery/logic/service/thumbnail_service.dart';
import 'package:pg_slema/features/gallery/presentation/screen/image_screen.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class SingleImageWidget extends StatefulWidget {
  final ImageMetadata metadata;
  final ThumbnailService thumbnailService;

  const SingleImageWidget({
    super.key,
    required this.metadata,
    required this.thumbnailService,
  });

  @override
  State<SingleImageWidget> createState() => _SingleImageWidgetState();
}

class _SingleImageWidgetState extends State<SingleImageWidget> with Logger {
  static const int imageWidth = 80;
  static const int imageHeight = 100;

  late Future<Image?> thumbnailFuture;

  @override
  void initState() {
    super.initState();
    thumbnailFuture = widget.thumbnailService.loadThumbnail(
      widget.metadata.id,
      widget.metadata.filename,
      imageWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: InkWell(
        onTap: () => _onTapped(context),
        child: SizedBox(
          width: imageWidth.toDouble(),
          height: imageHeight.toDouble(),
          child: FutureBuilder(
            future: thumbnailFuture,
            builder: _futureBuilder,
          ),
        ),
      ),
    );
  }

  Widget _futureBuilder(BuildContext context, AsyncSnapshot<Image?> snapshot) {
    if (snapshot.connectionState != ConnectionState.done) {
      return const CircularProgressIndicator();
    }

    if (snapshot.data == null) {
      logger.error("Failed loading image: ${widget.metadata.filename}");
      return const Text("Failed loading image.");
    }

    return snapshot.data!;
  }

  void _onTapped(BuildContext context) {
    logger.debug("Tapped image ${widget.metadata.filename}");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageScreen(
          metadata: widget.metadata,
        ),
      ),
    );
  }
}
