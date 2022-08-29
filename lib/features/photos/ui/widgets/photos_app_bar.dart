import 'package:flutter/material.dart';

class PhotosAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PhotosAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Theme.of(context).canvasColor,
      leading: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: const Icon(Icons.menu),
      ),
      title: Text(
        'Discover',
        style: Theme.of(context).textTheme.headline4?.copyWith(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
