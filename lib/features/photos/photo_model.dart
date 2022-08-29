import 'photo_remote_entity_model.dart';

class PhotoModel {
  final String smallPhotoUrl;
  final String regularPhotoUrl;
  final String largePhotoUrl;
  final String username;
  final String userFirstName;
  final String userLastName;
  final String userBio;
  final String title;
  final int likes;
  const PhotoModel({
    required this.smallPhotoUrl,
    required this.regularPhotoUrl,
    required this.largePhotoUrl,
    required this.username,
    required this.userFirstName,
    required this.userLastName,
    required this.userBio,
    required this.title,
    required this.likes,
  });

  PhotoModel copyWith({
    String? smallPhotoUrl,
    String? regularPhotoUrl,
    String? largePhotoUrl,
    String? username,
    String? userFirstName,
    String? userLastName,
    String? title,
    int? likes,
    String? userBio,
  }) {
    return PhotoModel(
      smallPhotoUrl: smallPhotoUrl ?? this.smallPhotoUrl,
      regularPhotoUrl: regularPhotoUrl ?? this.regularPhotoUrl,
      largePhotoUrl: largePhotoUrl ?? this.largePhotoUrl,
      username: username ?? this.username,
      userFirstName: userFirstName ?? this.userFirstName,
      userLastName: userLastName ?? this.userLastName,
      title: title ?? this.title,
      likes: likes ?? this.likes,
      userBio: userBio ?? this.userBio,
    );
  }

  factory PhotoModel.fromRemoteEntity(PhotoRemoteEntity photoRemoteEntity) {
    return PhotoModel(
      smallPhotoUrl: photoRemoteEntity.urls.small,
      regularPhotoUrl: photoRemoteEntity.urls.regular,
      largePhotoUrl: photoRemoteEntity.urls.full,
      username: photoRemoteEntity.user.username,
      userFirstName: photoRemoteEntity.user.firstName ?? '',
      userLastName: photoRemoteEntity.user.lastName ?? '',
      title: photoRemoteEntity.id,
      likes: photoRemoteEntity.likes ?? 0,
      userBio: photoRemoteEntity.user.bio ?? '',
    );
  }

  @override
  String toString() {
    return 'PhotoModel(smallPhotoUrl: $smallPhotoUrl, regularPhotoUrl: $regularPhotoUrl, largePhotoUrl: $largePhotoUrl, username: $username, userFirstName: $userFirstName, userLastName: $userLastName, title: $title, description: $likes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhotoModel &&
        other.smallPhotoUrl == smallPhotoUrl &&
        other.regularPhotoUrl == regularPhotoUrl &&
        other.largePhotoUrl == largePhotoUrl &&
        other.username == username &&
        other.userFirstName == userFirstName &&
        other.userLastName == userLastName &&
        other.title == title &&
        other.likes == likes;
  }

  @override
  int get hashCode {
    return smallPhotoUrl.hashCode ^
        regularPhotoUrl.hashCode ^
        largePhotoUrl.hashCode ^
        username.hashCode ^
        userFirstName.hashCode ^
        userLastName.hashCode ^
        title.hashCode ^
        likes.hashCode;
  }
}
