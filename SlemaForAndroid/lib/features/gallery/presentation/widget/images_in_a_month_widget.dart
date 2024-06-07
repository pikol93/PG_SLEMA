import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pg_slema/features/gallery/logic/entity/image_metadata.dart';
import 'package:pg_slema/features/gallery/logic/service/thumbnail_service_impl.dart';
import 'package:pg_slema/features/gallery/presentation/widget/single_image_widget.dart';
import 'package:pg_slema/utils/log/logger_mixin.dart';

class ImagesInAMonthWidget extends StatelessWidget with Logger {
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
    final dateFormat = DateFormat.yMMMM(locale.toString());

    return Row(
      children: [
        Expanded(
          child: Text(
            dateFormat.format(time),
            style: Theme.of(context).textTheme.labelLarge,
            softWrap: true,
          ),
        )
      ],
    );
  }

  Widget _buildImages() {
    final thumbnailService = ThumbnailServiceImpl();
    final widgets = images
        .map((item) => SingleImageWidget(
              metadata: item,
              thumbnailService: thumbnailService,
            ))
        .toList(growable: false);

    return Row(
      children: [
        Expanded(
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: widgets,
          ),
        )
      ],
    );
  }
}
