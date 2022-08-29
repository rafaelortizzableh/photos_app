import 'package:flutter/foundation.dart';

import '../../../core/core.dart';
import '../photos.dart';

@immutable
class PhotosStateModel {
  const PhotosStateModel({
    required this.photos,
    required this.authorPhotos,
    required this.photosPage,
    required this.selectedAuthorPhotosPage,
    this.selectedAuthor,
    this.failure,
  });

  final List<PhotoModel> photos;
  final List<PhotoModel> authorPhotos;
  final PhotoAuthor? selectedAuthor;
  final int photosPage;
  final int selectedAuthorPhotosPage;
  final Failure? failure;

  factory PhotosStateModel.initial() {
    return const PhotosStateModel(
      photos: <PhotoModel>[],
      authorPhotos: <PhotoModel>[],
      photosPage: 0,
      selectedAuthorPhotosPage: 0,
    );
  }

  PhotosStateModel removeFailure() {
    return PhotosStateModel(
      photos: photos,
      authorPhotos: authorPhotos,
      photosPage: photosPage,
      selectedAuthorPhotosPage: selectedAuthorPhotosPage,
      failure: null,
    );
  }

  PhotosStateModel copyWith({
    List<PhotoModel>? photos,
    List<PhotoModel>? authorPhotos,
    PhotoAuthor? selectedAuthor,
    int? photosPage,
    int? selectedAuthorPhotosPage,
    Failure? failure,
  }) {
    return PhotosStateModel(
      photos: photos ?? this.photos,
      authorPhotos: authorPhotos ?? this.authorPhotos,
      selectedAuthor: selectedAuthor ?? this.selectedAuthor,
      photosPage: photosPage ?? this.photosPage,
      selectedAuthorPhotosPage:
          selectedAuthorPhotosPage ?? this.selectedAuthorPhotosPage,
      failure: failure ?? this.failure,
    );
  }

  @override
  String toString() {
    return 'PhotosStateModel(photos: $photos, authorPhotos: $authorPhotos, selectedAuthor: $selectedAuthor, photosPage: $photosPage, selectedAuthorPhotosPage: $selectedAuthorPhotosPage, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhotosStateModel &&
        listEquals(other.photos, photos) &&
        listEquals(other.authorPhotos, authorPhotos) &&
        other.selectedAuthor == selectedAuthor &&
        other.photosPage == photosPage &&
        other.selectedAuthorPhotosPage == selectedAuthorPhotosPage &&
        other.failure == failure;
  }

  @override
  int get hashCode {
    return photos.hashCode ^
        authorPhotos.hashCode ^
        selectedAuthor.hashCode ^
        photosPage.hashCode ^
        selectedAuthorPhotosPage.hashCode ^
        failure.hashCode;
  }
}
