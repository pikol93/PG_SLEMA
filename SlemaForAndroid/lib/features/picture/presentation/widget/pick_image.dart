import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pg_slema/features/picture/application/service/impl/picture_service.dart';
import 'package:pg_slema/features/picture/data/repository/impl/picture_repository.dart';
import 'package:pg_slema/features/picture/domain/picture.dart';
import 'package:pg_slema/features/picture/presentation/controller/picture_controller.dart';
import 'package:pg_slema/utils/connector/shared_preferences_connector.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  late PictureController _pictureController;

  late PictureRepository repository;
  late PictureService pictureService;

  @override
  void initState() {
    super.initState();
    repository = PictureRepository(SharedPreferencesConnector());
    pictureService = PictureService(repository);
  }

  Future<void> pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _pictureController.setPictureFile(pickedFile);
      String imagePath = pickedFile.path;
      String fileName = pickedFile.name;
      String fileExtension = pickedFile.path.split('.').last;
      int fileSize = await pickedFile.length();

      pictureService.addPicture(Picture(
          const Uuid().v4(), imagePath, fileName, fileExtension, fileSize));
    } else {
      print('Nie wybrano żadnego obrazu.');
    }
  }

  @override
  Widget build(BuildContext context) {
    _pictureController = Provider.of<PictureController>(context);
    return Row(
      children: [
        IconButton(
          onPressed: () {
            pickImage(context);
          },
          icon: const Icon(Icons.image_search),
        ),
        IconButton(
          onPressed: () async {
            try {
              List<Picture> pictures =
                  (await pictureService.getAllPictures()).cast<Picture>();
              for (var p in pictures) {
                print(p);
              }
            } catch (error) {
              print("Error fetching pictures: $error");
            }
          },
          icon: const Icon(Icons.question_mark),
        ),
      ],
    );
  }
}
