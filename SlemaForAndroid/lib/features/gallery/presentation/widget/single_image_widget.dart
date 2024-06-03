import 'package:flutter/material.dart';
import 'package:pg_slema/features/gallery/logic/entity/image_metadata.dart';
import 'package:pg_slema/features/gallery/presentation/screen/image_screen.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class SingleImageWidget extends StatelessWidget with Logger {
  final ImageMetadata metadata;

  const SingleImageWidget({
    super.key,
    required this.metadata,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => _onTapped(context),
        child: const SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  void _onTapped(BuildContext context) {
    logger.debug("Tapped image ${metadata.filename}");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageScreen(
          metadata: metadata,
        ),
      ),
    );
  }
}
