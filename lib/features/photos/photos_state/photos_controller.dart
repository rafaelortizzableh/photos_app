import 'package:flutter/material.dart';

import '../photos.dart';

class PhotosController extends ValueNotifier<PhotosStateModel> {
  PhotosController(
    super.value, {
    required PhotosService photosService,
  }) : _photosService = photosService;

  final PhotosService _photosService;

  void getPhotos({int page = 1}) async {
    final photosResult = await _photosService.getPhotos(page: page);
    photosResult.when(
      (error) => value = value.copyWith(failure: error),
      (photos) => value = value.copyWith(photos: photos),
    );
  }

  void getAuthorPhotos({required String username, int page = 1}) async {
    final photosResult = await _photosService.getAuthorPhotos(
      username: username,
      page: page,
    );
    photosResult.when(
      (error) => value = value.copyWith(failure: error),
      (photos) => value = value.copyWith(photos: photos),
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
