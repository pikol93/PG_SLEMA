import 'package:flutter/material.dart';
import 'package:pg_slema/features/picture/application/service/impl/picture_service_impl.dart';
import 'package:pg_slema/features/picture/data/dto/converter/picture_dto_to_json_converter.dart';
import 'package:pg_slema/features/picture/data/repository/impl/shared_preferences_picture_repository.dart';
import 'package:pg_slema/features/picture/presentation/controller/picture_list_controller.dart';
import 'package:pg_slema/features/picture/presentation/controller/take_picture_controller.dart';
import 'package:pg_slema/features/picture/presentation/widget/pick_picture.dart';
import 'package:pg_slema/features/picture/presentation/widget/picture_list.dart';
import 'package:pg_slema/features/picture/presentation/widget/take_picture.dart';
import 'package:pg_slema/utils/connector/shared_preferences_connector.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  ExercisesScreenState createState() => ExercisesScreenState();
}

class ExercisesScreenState extends State<ExercisesScreen> {
  late PictureListController _pictureListController;
  late TakePictureController _takePictureController;
  @override
  void initState() {
    super.initState();
    SharedPreferencesPictureRepository pictureRepository = SharedPreferencesPictureRepository(PictureDtoToJsonConverter());
    PictureServiceImpl pictureService = PictureServiceImpl(pictureRepository);
    _pictureListController = PictureListController(
      pictureService,
    );
    _takePictureController = TakePictureController(pictureService);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              PickPicture(
                  voidCallbackAfterAddedImage:
                      _pictureListController.refreshPicturesData),
              TakePicture(
                voidCallbackAfterAddedImage:
                    _pictureListController.refreshPicturesData,
                takePictureController: _takePictureController,
              ),
              PictureList(pictureListController: _pictureListController)
            ],
          ),
        ],
      ),
    );
  }
}
