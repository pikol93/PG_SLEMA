import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pg_slema/features/gallery/logic/entity/image_metadata.dart';
import 'package:pg_slema/features/gallery/logic/repository/stored_image_metadata_repository.dart';
import 'package:pg_slema/features/gallery/logic/service/image_service.dart';
import 'package:pg_slema/features/gallery/presentation/widget/images_in_a_month_widget.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';
import 'package:pg_slema/utils/widgets/appbars/white_app_bar.dart';
import 'package:pg_slema/utils/widgets/default_body/default_body_with_multiple_floating_action_buttons.dart';

class GalleryScreen extends StatefulWidget {
  final StoredImageMetadataRepository repository;
  final ImageService service;

  const GalleryScreen({
    super.key,
    required this.repository,
    required this.service,
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
  void dispose() {
    super.dispose();
    widget.repository
        .getChangeNotifier()
        .removeListener(_onImageMetadataChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WhiteAppBar(titleText: "Galeria"),
        DefaultBodyWithMultipleFloatingActionButtons(
          buttons: [
            (_onAddButtonPressed, Icons.add),
            (_onCameraButtonPressed, Icons.camera_alt),
          ],
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
          logger.error("Returned result has an error: ${result.error}");
          return _buildError();
        }

        if (result.data == null) {
          logger.error("Result data is null...");
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

    // Group by year and month
    final list = List<((int, int), List<ImageMetadata>)>.empty(growable: true);
    images
        .groupListsBy((item) => (item.date.year, item.date.month))
        .forEach((key, value) {
      list.add((key, value));
    });

    list.sort((a, b) {
      final yearCompare = b.$1.$1.compareTo(a.$1.$1);
      if (yearCompare != 0) {
        return yearCompare;
      }

      final monthCompare = b.$1.$2.compareTo(a.$1.$2);
      return monthCompare;
    });

    final children = list
        .map(
          (item) => ImagesInAMonthWidget(
            time: DateTime(
              item.$1.$1,
              item.$1.$2,
            ),
            images: item.$2.sorted(
              (item1, item2) => item2.date.compareTo(item1.date),
            ),
          ),
        )
        .toList(growable: false);

    return ListView.builder(
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
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
    setState(() {
      imageMetadataFuture = widget.service.loadImageData();
    });
  }

  Future _onAddButtonPressed() async {
    logger.debug("Gallery screen add button pressed");
    widget.service.selectAndAddImageFromGallery();
  }

  Future _onCameraButtonPressed() async {
    logger.debug("Gallery screen camera button pressed");
    widget.service.createAndAddImageViaCamera();
  }
}
