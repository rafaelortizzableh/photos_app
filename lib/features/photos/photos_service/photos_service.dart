import 'package:flutter/material.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';
import '../photos.dart';

part 'photos_service_wrapper.dart';

abstract class PhotosService {
  Future<Result<Failure, List<PhotoModel>>> getPhotos({required int page});
  Future<Result<Failure, List<PhotoModel>>> getAuthorPhotos({
    required String username,
    required int page,
  });
}

class RemotePhotoService implements PhotosService {
  final PhotosRepository _photosRepository;
  RemotePhotoService(this._photosRepository);
  @override
  Future<Result<Failure, List<PhotoModel>>> getAuthorPhotos({
    required String username,
    required int page,
  }) async {
    try {
      final remotePhotos = await _photosRepository.getAuthorPhotos(
        username: username,
        page: page,
      );
      final photos = remotePhotos.map(
        (photoRemoteEntity) => PhotoModel.fromRemoteEntity(photoRemoteEntity),
      );
      return Success(photos.toList());
    } catch (failure) {
      if (failure is! Failure) rethrow;
      return Error(failure);
    }
  }

  @override
  Future<Result<Failure, List<PhotoModel>>> getPhotos({
    required int page,
  }) async {
    try {
      final remotePhotos = await _photosRepository.getPhotos(page: page);
      final photos = remotePhotos.map(
        (photoRemoteEntity) => PhotoModel.fromRemoteEntity(photoRemoteEntity),
      );
      return Success(photos.toList());
    } catch (failure) {
      if (failure is! Failure) rethrow;
      return Error(failure);
    }
  }
}
