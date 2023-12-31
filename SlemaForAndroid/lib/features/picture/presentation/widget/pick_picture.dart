import 'package:flutter/material.dart';
import 'package:pg_slema/features/picture/application/service/impl/picture_service_impl.dart';
import 'package:pg_slema/features/picture/data/repository/impl/picture_repository_impl.dart';
import 'package:pg_slema/features/picture/presentation/controller/log_shared_preferences_picture_controller.dart';
import 'package:pg_slema/utils/connector/shared_preferences_connector.dart';
import 'package:pg_slema/features/picture/presentation/controller/pick_picture_controller.dart';

class PickPicture extends StatefulWidget {
  final VoidCallback voidCallbackAfterAddedImage;
  const PickPicture({super.key, required this.voidCallbackAfterAddedImage});

  @override
  State<PickPicture> createState() => _PickPictureState();
}

class _PickPictureState extends State<PickPicture> {
  late PickPictureController pickImageController;
  late LogSharedPreferencesPictureController
      logSharedPreferencesPictureController;

  @override
  void initState() {
    super.initState();
    PictureRepositoryImpl repository =
        PictureRepositoryImpl(SharedPreferencesConnector());
    PictureServiceImpl pictureService = PictureServiceImpl(repository);
    pickImageController = PickPictureController(pictureService);
    logSharedPreferencesPictureController =
        LogSharedPreferencesPictureController(pictureService);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () async {
            await pickImageController.pickPicture();
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
