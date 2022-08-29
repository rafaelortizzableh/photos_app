import 'package:flutter/material.dart';

import '../../../photos/photos.dart';

class PhotosGrid extends StatelessWidget {
  const PhotosGrid({
    Key? key,
    required this.photos,
    required this.scrollController,
  }) : super(key: key);
  final List<PhotoModel> photos;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(
        top: 33.0,
        right: 21.0,
        left: 26.0,
      ),
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 26.0,
        crossAxisSpacing: 26.0,
        childAspectRatio: 0.69,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        final photo = photos[index];
        final isRightSide = index % 2 != 0;
        final animationDuration = !isRightSide
            ? const Duration(seconds: 2)
            : const Duration(seconds: 1);
        return PhotoItem(
          isRightSide: isRightSide,
          animationDuration: animationDuration,
          photo: photo,
        );
      },
    );
  }
}
