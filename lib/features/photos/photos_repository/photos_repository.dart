import 'dart:io' show SocketException;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

import '../../../core/core.dart';
import '../photos.dart';

part 'photos_repository_wrapper.dart';

abstract class PhotosRepository {
  Future<List<PhotoRemoteEntity>> getPhotos({required int page});
  Future<List<PhotoRemoteEntity>> getAuthorPhotos({
    required String username,
    required int page,
  });
}

class UnsplashPhotosRepository implements PhotosRepository {
  final Dio _dio;
  const UnsplashPhotosRepository(
    this._dio,
  );
  static const _noConnectionMessage = 'No Internet connection';

  static Map<String, dynamic> _createHeaders() {
    return {'Authorization': 'Client-ID ${AppConstants.unsplashApiKey}'};
  }

  @override
  Future<List<PhotoRemoteEntity>> getAuthorPhotos({
    required String username,
    int page = 1,
  }) async {
    try {
      final response = await _dio.get(
        'https://api.unsplash.com/users/$username/photos?page=$page',
        options: Options(
          headers: _createHeaders(),
        ),
      );

      final unwrappedList = response.data as List;
      final photos = unwrappedList
          .map(
            (photo) => PhotoRemoteEntity.fromMap(photo),
          )
          .toList();
      return photos;
    } on DioError catch (e) {
      debugPrint(e.toString());
      if (e is SocketException) {
        throw Failure(
          message: _noConnectionMessage,
          exception: e,
        );
      }
      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        code: e.response?.statusCode,
      );
    }
  }

  @override
  Future<List<PhotoRemoteEntity>> getPhotos({int page = 1}) async {
    try {
      final response = await _dio.get(
        'https://api.unsplash.com/photos?page=$page',
        options: Options(
          headers: _createHeaders(),
        ),
      );

      final unwrappedList = response.data as List;
      final filteredList = unwrappedList.whereNot(
        (element) => element['sponsorship'] != null,
      );
      final photos = filteredList
          .map(
            (photo) => PhotoRemoteEntity.fromMap(photo),
          )
          .toList();
      return photos;
    } on DioError catch (e) {
      debugPrint(e.toString());
      if (e is SocketException) {
        throw Failure(
          message: _noConnectionMessage,
          exception: e,
        );
      }
      throw Failure(
        message: e.response?.statusMessage ?? 'Something went wrong',
        code: e.response?.statusCode,
      );
    }
  }
}
