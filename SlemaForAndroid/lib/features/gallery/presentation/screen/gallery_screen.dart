import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pg_slema/features/gallery/logic/entity/image_metadata.dart';
import 'package:pg_slema/features/gallery/logic/repository/image_metadata_repository.dart';
import 'package:pg_slema/features/gallery/presentation/widget/images_in_a_month_widget.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/utils/widgets/appbars/white_app_bar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body_with_floating_action_button.dart';

class GalleryScreen extends StatefulWidget {
  final ImageMetadataRepository repository;

  const GalleryScreen({
    super.key,
    required this.repository,
  });

  @override
  GalleryScreenState createState() => GalleryScreenState();
}

class GalleryScreenState extends State<GalleryScreen> with Logger {
  late Future<List<ImageMetadata>> imageMetadataFuture;

  @override
  void initState() {
    super.initState();
    widget.repository.getChangeNotifier().addListener(_onImageMetadataChanged);
    _onImageMetadataChanged();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WhiteAppBar(titleText: "Galeria"),
        DefaultBodyWithFloatingActionButton(
          onFloatingButtonPressed: _onFloatingButtonPressed,
          child: _buildFuture(),
        ),
      ],
    );
  }

  Widget _buildFuture() {
    return FutureBuilder(
      future: imageMetadataFuture,
      builder: (context, result) {
        if (result.hasError) {
          return _buildError();
        }

        return _buildImageList(result.data!);
      },
    );
  }

  Widget _buildImageList(List<ImageMetadata> images) {
    if (images.isEmpty) {
      return _buildNoImages();
    }

    // TODO: Group by year and month
    return ImagesInAMonthWidget(
      time: DateTime(2023, 12),
      images: images,
    );
  }

  Widget _buildError() {
    return const Text("Failed loading image metadata. This should not happen.");
  }

  Widget _buildNoImages() {
    return const Text("No images.");
  }

  void _onImageMetadataChanged() {
    logger.debug("Image metadata changed, getting the future...");
    imageMetadataFuture = widget.repository.getAll();
  }

  void _onFloatingButtonPressed() {
    logger.debug("Gallery screen floating button pressed");
    // TODO: Finish this
  }
}
