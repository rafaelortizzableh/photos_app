import 'package:flutter/material.dart';
import 'package:photos_app/features/photos/photos.dart';

import 'package:provider/provider.dart';

class PhotosControllerWrapper extends StatelessWidget {
  const PhotosControllerWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PhotosRepositoryWrapper(
      child: Builder(
        builder: (context) {
          return PhotosServiceWrapper(
            photosRepository: context.read<PhotosRepository>(),
            child: Builder(
              builder: (context) {
                return ChangeNotifierProvider<PhotosController>(
                  create: (context) => PhotosController(
                    PhotosStateModel.initial(),
                    photosService: context.read<PhotosService>(),
                  ),
                  child: child,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
