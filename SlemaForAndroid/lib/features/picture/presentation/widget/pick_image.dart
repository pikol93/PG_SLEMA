import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pg_slema/features/picture/presentation/controller/picture_controller.dart';
import 'package:provider/provider.dart';

class PickImage extends StatefulWidget {
  const PickImage({super.key});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  late PictureController _pictureController;
  Future<void> pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _pictureController.setPictureFile(pickedFile);
      String imagePath = pickedFile.path;
      String fileName = pickedFile.name;
      int fileSize = await pickedFile.length();
      String fileExtension = pickedFile.path.split('.').last;

      print("Nazwa pliku: $fileName");
      print("Rozmiar pliku: $fileSize bajtów");
      print("Rozszerzenie pliku: $fileExtension");
      print("Ścieżka pliku: $imagePath");
    } else {
      print('Nie wybrano żadnego obrazu.');
    }
  }

  @override
  Widget build(BuildContext context) {
    _pictureController = Provider.of<PictureController>(context);
    return IconButton(
        onPressed: () {
          pickImage(context);
        },
        icon: const Icon(Icons.image_search));
  }
}
