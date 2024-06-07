import 'package:flutter/material.dart';
import 'package:pg_slema/features/gallery/logic/entity/image_metadata.dart';
import 'package:pg_slema/features/gallery/presentation/screen/image_screen.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class SingleImageWidget extends StatefulWidget {
  final ImageMetadata metadata;

  const SingleImageWidget({
    super.key,
    required this.metadata,
  });

  @override
  State<SingleImageWidget> createState() => _SingleImageWidgetState();
}

class _SingleImageWidgetState extends State<SingleImageWidget> with Logger {
  late Future<void> thumbnailFuture;

  @override
  void initState() {
    super.initState();
    // TODO: Insert actual future
    thumbnailFuture = Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => _onTapped(context),
        child: SizedBox(
          width: 50,
          height: 50,
          child: FutureBuilder(
            future: thumbnailFuture,
            builder: _futureBuilder,
          ),
        ),
      ),
    );
  }

  Widget _futureBuilder(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.connectionState != ConnectionState.done) {
      return const CircularProgressIndicator();
    }

    return const Text("asd");
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
