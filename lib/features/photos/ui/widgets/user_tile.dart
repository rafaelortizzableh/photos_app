import 'package:flutter/material.dart';

import '../../photos.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.photo,
    required this.textTheme,
  }) : super(key: key);

  final PhotoModel photo;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AuthorScreen.routeName,
          arguments: photo.photoAuthor,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(
              photo.photoAuthor.profilePicUrl ?? photo.smallPhotoUrl,
            ),
            radius: 37.0,
          ),
          const SizedBox(width: 8.0),
          SizedBox(
            height: 37.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  photo.photoAuthor.name ?? photo.photoAuthor.username,
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
