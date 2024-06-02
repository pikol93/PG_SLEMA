import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pg_slema/features/gallery/logic/entity/image_metadata.dart';
import 'package:pg_slema/features/gallery/presentation/widget/single_image_widget.dart';

class ImagesInAMonthWidget extends StatelessWidget {
  final DateTime time;
  final List<ImageMetadata> images;

  const ImagesInAMonthWidget({
    super.key,
    required this.time,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSectionTitle(context),
        _buildImages(),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final dateFormat = DateFormat.yM(locale);

    return Row(
      children: [
        Expanded(
          child: Text(dateFormat.format(time)),
        )
      ],
    );
  }

  Widget _buildImages() {
    final widgets = images
        .map((item) => SingleImageWidget(metadata: item))
        .toList(growable: false);

    return Wrap(
      children: widgets,
    );
  }
}
