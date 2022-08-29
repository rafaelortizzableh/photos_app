import 'package:flutter/material.dart';

import '../photos.dart';

class PhotosController extends ValueNotifier<PhotosStateModel> {
  PhotosController(
    super.value, {
    required PhotosService photosService,
  }) : _photosService = photosService;

  final PhotosService _photosService;

  void getPhotos() async {
    final newPhotosPage = value.photosPage + 1;
    final photosResult = await _photosService.getPhotos(page: newPhotosPage);
    photosResult.when(
      (error) => value = value.copyWith(failure: error),
      (photos) {
        final currentPhotos = value.photos;
        final newPhotos = [...currentPhotos, ...photos].toList();
        value = value.copyWith(
          photos: newPhotos,
          photosPage: newPhotosPage,
        );
      },
    );
  }

  void getAuthorPhotos({
    required String username,
  }) async {
    final newPhotosPage = value.selectedAuthorPhotosPage + 1;
    final photosResult = await _photosService.getAuthorPhotos(
      username: username,
      page: newPhotosPage,
    );
    photosResult.when(
      (error) => value = value.copyWith(failure: error),
      (photos) {
        final currentPhotos = value.authorPhotos;
        final newPhotos = [...currentPhotos, ...photos].toList();
        value = value.copyWith(
          authorPhotos: newPhotos,
          selectedAuthorPhotosPage: newPhotosPage,
        );
      },
    );
  }

  void selectAuthorFromPhoto({required PhotoModel photo}) {
    final photoAuthor = photo.photoAuthor;
    value = value.copyWith(selectedAuthor: photoAuthor);
  }

  void unselectAuthorFromPhoto() {
    value = value.removeSelectedAuthor();
  }
}
