import 'package:flutter/material.dart';
import 'package:pg_slema/features/picture/application/service/impl/picture_service.dart';
import 'package:pg_slema/features/picture/data/repository/impl/picture_repository.dart';
import 'package:pg_slema/features/picture/presentation/controller/log_SP_picture_controller.dart';
import 'package:pg_slema/utils/connector/shared_preferences_connector.dart';
import 'package:pg_slema/features/picture/presentation/controller/pick_image_controller.dart';

class PickImage extends StatefulWidget {
  final VoidCallback voidCallbackAfterAddedImage;
  const PickImage({super.key, required this.voidCallbackAfterAddedImage});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  late PickImageController pickImageController;
  late LogSharedPreferencesPictureController
      logSharedPreferencesPictureController;

  @override
  void initState() {
    super.initState();
    PictureRepository repository =
        PictureRepository(SharedPreferencesConnector());
    PictureService pictureService = PictureService(repository);
    pickImageController = PickImageController(pictureService);
    logSharedPreferencesPictureController =
        LogSharedPreferencesPictureController(pictureService);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            await pickImageController.pickImage();
            widget.voidCallbackAfterAddedImage();
          },
          icon: const Icon(Icons.image_search),
        ),
        IconButton(
          onPressed: () async {
            logSharedPreferencesPictureController.printGetAllPictures();
          },
          icon: const Icon(Icons.question_mark),
        ),
      ],
    );
  }
}
