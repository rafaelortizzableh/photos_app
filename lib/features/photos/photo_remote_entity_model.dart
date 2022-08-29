// To parse this JSON data, do
//
//     final photoRemoteEntity = photoRemoteEntityFromMap(jsonString);

class PhotoRemoteEntity {
  PhotoRemoteEntity({
    required this.id,
    required this.urls,
    required this.photoAuthorRemoteEntity,
    this.createdAt,
    this.updatedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.links,
    this.likes,
  });

  final String id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? width;
  final int? height;
  final String? color;
  final String? blurHash;
  final String? description;
  final String? altDescription;
  final UrlsRemoteEntity urls;
  final PhotoRemoteEntityLinks? links;
  final int? likes;
  final PhotoAuthorRemoteEntity photoAuthorRemoteEntity;

  factory PhotoRemoteEntity.fromMap(Map<String, dynamic> map) =>
      PhotoRemoteEntity(
        id: map['id'],
        createdAt: DateTime.tryParse(map['created_at']),
        updatedAt: DateTime.tryParse(map['updated_at']),
        width: map['width'],
        height: map['height'],
        color: map['color'],
        blurHash: map['blur_hash'],
        description: map['description'],
        altDescription: map['alt_description'],
        urls: UrlsRemoteEntity.fromMap(map['urls']),
        links: PhotoRemoteEntityLinks.fromMap(map['links']),
        likes: map['likes'],
        photoAuthorRemoteEntity: PhotoAuthorRemoteEntity.fromMap(map['user']),
      );
}

class PhotoRemoteEntityLinks {
  PhotoRemoteEntityLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  final String? self;
  final String? html;
  final String? download;
  final String? downloadLocation;

  factory PhotoRemoteEntityLinks.fromMap(Map<String, dynamic> json) =>
      PhotoRemoteEntityLinks(
        self: json['self'],
        html: json['html'],
        download: json['download'],
        downloadLocation: json['download_location'],
      );
}

class Sponsorship {
  Sponsorship({
    this.impressionUrls,
    this.tagline,
    this.taglineUrl,
    this.sponsor,
  });

  final List<String>? impressionUrls;
  final String? tagline;
  final String? taglineUrl;
  final PhotoAuthorRemoteEntity? sponsor;

  factory Sponsorship.fromMap(Map<String, dynamic> json) => Sponsorship(
        impressionUrls:
            List<String>.from(json['impression_urls'].map((x) => x)),
        tagline: json['tagline'],
        taglineUrl: json['tagline_url'],
        sponsor: PhotoAuthorRemoteEntity.fromMap(json['sponsor']),
      );
}

class PhotoAuthorRemoteEntity {
  PhotoAuthorRemoteEntity({
    required this.id,
    required this.username,
    this.updatedAt,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
    this.forHire,
  });

  final String id;
  final DateTime? updatedAt;
  final String username;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? twitterUsername;
  final String? portfolioUrl;
  final String? bio;
  final ProfileImageRemoteEntity? profileImage;
  final String? instagramUsername;
  final int? totalCollections;
  final int? totalLikes;
  final int? totalPhotos;
  final bool? acceptedTos;
  final bool? forHire;

  factory PhotoAuthorRemoteEntity.fromMap(Map<String, dynamic> json) =>
      PhotoAuthorRemoteEntity(
        id: json['id'],
        updatedAt: DateTime.parse(json['updated_at']),
        username: json['username'],
        name: json['name'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        twitterUsername: json['twitter_username'],
        portfolioUrl: json['portfolio_url'],
        bio: json['bio'],
        profileImage: ProfileImageRemoteEntity.fromMap(json['profile_image']),
        instagramUsername: json['instagram_username'],
        totalCollections: json['total_collections'],
        totalLikes: json['total_likes'],
        totalPhotos: json['total_photos'],
        acceptedTos: json['accepted_tos'],
        forHire: json['for_hire'],
      );
}

class ProfileImageRemoteEntity {
  ProfileImageRemoteEntity({
    this.small,
    this.medium,
    this.large,
  });

  final String? small;
  final String? medium;
  final String? large;

  factory ProfileImageRemoteEntity.fromMap(Map<String, dynamic> json) =>
      ProfileImageRemoteEntity(
        small: json['small'],
        medium: json['medium'],
        large: json['large'],
      );
}

class UrlsRemoteEntity {
  UrlsRemoteEntity({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;
  final String smallS3;

  factory UrlsRemoteEntity.fromMap(Map<String, dynamic> json) =>
      UrlsRemoteEntity(
        raw: json['raw'],
        full: json['full'],
        regular: json['regular'],
        small: json['small'],
        thumb: json['thumb'],
        smallS3: json['small_s3'],
      );
}
