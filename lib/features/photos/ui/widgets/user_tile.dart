import 'package:flutter/material.dart';

import '../../photos.dart';

class UserTileOnPhotosDetailPage extends StatelessWidget {
  const UserTileOnPhotosDetailPage({
    Key? key,
    required this.photoAuthor,
    required this.textTheme,
  }) : super(key: key);

  final PhotoAuthor photoAuthor;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AuthorScreen.routeName,
          arguments: photoAuthor,
          (route) => route.isFirst,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 37.0,
            width: 37.0,
            child: Hero(
              tag: photoAuthor.username,
              child: CircleAvatar(
                foregroundImage: NetworkImage(
                  photoAuthor.profilePicUrl ?? '',
                ),
                radius: 37.0,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          SizedBox(
            height: 37.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  photoAuthor.name ?? photoAuthor.username,
                  style: textTheme.subtitle1?.copyWith(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'View Profile',
                  style: textTheme.subtitle1?.copyWith(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UserTileOnAuthorPage extends StatelessWidget {
  const UserTileOnAuthorPage({
    Key? key,
    required this.photoAuthor,
    required this.textTheme,
  }) : super(key: key);

  final PhotoAuthor photoAuthor;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 22.0,
        top: 25.0,
        bottom: 25.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 63.0,
            width: 63.0,
            child: Hero(
              tag: photoAuthor.username,
              child: CircleAvatar(
                foregroundImage: NetworkImage(
                  photoAuthor.profilePicUrl ?? '',
                ),
                radius: 63.0,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  photoAuthor.name ?? photoAuthor.username,
                  style: textTheme.subtitle1?.copyWith(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                if (photoAuthor.bio != null) ...[
                  Text(
                    photoAuthor.bio!,
                    style: textTheme.subtitle1?.copyWith(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}
