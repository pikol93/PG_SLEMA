import 'package:flutter/material.dart';
import 'package:pg_slema/features/picture/presentation/controller/picture_list_controller.dart';

class PictureList extends StatefulWidget {
  final PictureListController pictureListController;
  const PictureList({super.key, required this.pictureListController});

  @override
  _PictureListState createState() => _PictureListState();
}

class _PictureListState extends State<PictureList> {
  final int _navigationBarSizeHardcoded = 200;

  Container _buildImageContainer(int index) {
    final imageBytes = widget.pictureListController.picturesImages[index];
    final imageName = widget.pictureListController.pictures[index].name;

    return Container(
      margin: const EdgeInsets.all(20.0),
      child: imageBytes != null
          ? Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Text(imageName),
                Image.memory(imageBytes)
              ],
            )
          : const Placeholder(
              fallbackHeight: 100,
              fallbackWidth: 100,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<void>(
      stream: widget.pictureListController.refreshStream,
      builder: (context, snapshot) {
        return SizedBox(
          height: MediaQuery.of(context).size.height -
              _navigationBarSizeHardcoded, // hardcoded fix for bottomNavigationBar overlapping content
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return _buildImageContainer(index);
                  },
                  childCount:
                      widget.pictureListController.picturesImages.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
