import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../photos.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({
    Key? key,
    required this.isRightSide,
    required this.animationDuration,
    required this.photo,
  }) : super(key: key);

  final bool isRightSide;
  final Duration animationDuration;
  final PhotoModel photo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: isRightSide ? 26.0 : 0,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            PhotoDetailScreen.routeName,
            arguments: photo,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 151.0,
              maxHeight: 218.0,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _ImageTile(
                  animationDuration: animationDuration,
                  photo: photo,
                ),
                _FadeAndTitleOnImageTile(
                  animationDuration: animationDuration,
                  photo: photo,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageTile extends StatelessWidget {
  const _ImageTile({
    Key? key,
    required this.photo,
    required this.animationDuration,
  }) : super(key: key);
  final PhotoModel photo;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: SizedBox(
        width: 151.0,
        height: 218.0,
        child: NetworkFadingImage(
          path: photo.regularPhotoUrl,
          animationDuration: animationDuration,
        ),
      ),
    );
  }
}

class _FadeAndTitleOnImageTile extends StatefulWidget {
  const _FadeAndTitleOnImageTile({
    Key? key,
    required this.photo,
    required this.animationDuration,
  }) : super(key: key);
  final PhotoModel photo;
  final Duration animationDuration;

  @override
  State<_FadeAndTitleOnImageTile> createState() =>
      _FadeAndTitleOnImageTileState();
}

class _FadeAndTitleOnImageTileState extends State<_FadeAndTitleOnImageTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration)
          ..forward()
          ..addListener(_updatePosition);
    super.initState();
  }

  void _updatePosition() {
    setState(() => opacity = 1.0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AnimatedOpacity(
      duration: _animationController.duration ?? widget.animationDuration,
      opacity: opacity,
      child: SizedBox(
        height: 218.0,
        width: 151.0,
        child: FractionallySizedBox(
          heightFactor: 0.45,
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.70),
                  Colors.black.withOpacity(0.0),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.photo.title,
                    style: textTheme.bodyText1?.copyWith(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    '${widget.photo.likes} likes',
                    style: textTheme.bodyText2?.copyWith(
                      fontSize: 8.0,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(height: 9.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
