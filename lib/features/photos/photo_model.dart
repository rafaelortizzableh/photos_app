import 'photo_remote_entity_model.dart';

class PhotoModel {
  final String smallPhotoUrl;
  final String regularPhotoUrl;
  final String largePhotoUrl;
  final PhotoAuthor photoAuthor;
  final String title;
  final int likes;

  const PhotoModel({
    required this.smallPhotoUrl,
    required this.regularPhotoUrl,
    required this.largePhotoUrl,
    required this.photoAuthor,
    required this.title,
    required this.likes,
  });

  PhotoModel copyWith({
    String? smallPhotoUrl,
    String? regularPhotoUrl,
    String? largePhotoUrl,
    PhotoAuthor? photoAuthor,
    String? title,
    int? likes,
  }) {
    return PhotoModel(
      smallPhotoUrl: smallPhotoUrl ?? this.smallPhotoUrl,
      regularPhotoUrl: regularPhotoUrl ?? this.regularPhotoUrl,
      largePhotoUrl: largePhotoUrl ?? this.largePhotoUrl,
      photoAuthor: photoAuthor ?? this.photoAuthor,
      title: title ?? this.title,
      likes: likes ?? this.likes,
    );
  }

  factory PhotoModel.fromRemoteEntity(PhotoRemoteEntity photoRemoteEntity) {
    return PhotoModel(
      smallPhotoUrl: photoRemoteEntity.urls.small,
      regularPhotoUrl: photoRemoteEntity.urls.regular,
      largePhotoUrl: photoRemoteEntity.urls.full,
      photoAuthor: PhotoAuthor.fromPhotoAuthorRemoteEntity(
        photoRemoteEntity.photoAuthorRemoteEntity,
      ),
      title: photoRemoteEntity.id,
      likes: photoRemoteEntity.likes ?? 0,
    );
  }

  @override
  String toString() {
    return 'PhotoModel(smallPhotoUrl: $smallPhotoUrl, regularPhotoUrl: $regularPhotoUrl, largePhotoUrl: $largePhotoUrl, photoAuthor: $photoAuthor, title: $title, likes: $likes)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhotoModel &&
        other.smallPhotoUrl == smallPhotoUrl &&
        other.regularPhotoUrl == regularPhotoUrl &&
        other.largePhotoUrl == largePhotoUrl &&
        other.photoAuthor == photoAuthor &&
        other.title == title &&
        other.likes == likes;
  }

  @override
  int get hashCode {
    return smallPhotoUrl.hashCode ^
        regularPhotoUrl.hashCode ^
        largePhotoUrl.hashCode ^
        photoAuthor.hashCode ^
        title.hashCode ^
        likes.hashCode;
  }
}

class PhotoAuthor {
  final String username;
  final String? name;
  final String? thumbnailProfilePicUrl;
  final String? profilePicUrl;
  final String? bio;

  const PhotoAuthor({
    required this.username,
    this.name,
    this.thumbnailProfilePicUrl,
    this.profilePicUrl,
    this.bio,
  });

  PhotoAuthor copyWith({
    String? username,
    String? name,
    String? thumbnailProfilePicUrl,
    String? profilePicUrl,
    String? bio,
  }) {
    return PhotoAuthor(
      username: username ?? this.username,
      name: name ?? this.name,
      thumbnailProfilePicUrl:
          thumbnailProfilePicUrl ?? this.thumbnailProfilePicUrl,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      bio: bio ?? this.bio,
    );
  }

  factory PhotoAuthor.fromPhotoAuthorRemoteEntity(
      PhotoAuthorRemoteEntity photoAuthorRemoteEntity) {
    return PhotoAuthor(
      username: photoAuthorRemoteEntity.username,
      name: photoAuthorRemoteEntity.name,
      thumbnailProfilePicUrl: photoAuthorRemoteEntity.profileImage?.small,
      profilePicUrl: photoAuthorRemoteEntity.profileImage?.medium,
      bio: photoAuthorRemoteEntity.bio ?? '',
    );
  }

  @override
  String toString() {
    return 'PhotoAuthor(username: $username, name: $name, thumbnailProfilePicUrl: $thumbnailProfilePicUrl, profilePicUrl: $profilePicUrl, bio: $bio)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PhotoAuthor &&
        other.username == username &&
        other.name == name &&
        other.thumbnailProfilePicUrl == thumbnailProfilePicUrl &&
        other.profilePicUrl == profilePicUrl &&
        other.bio == bio;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        name.hashCode ^
        thumbnailProfilePicUrl.hashCode ^
        profilePicUrl.hashCode ^
        bio.hashCode;
  }
}
