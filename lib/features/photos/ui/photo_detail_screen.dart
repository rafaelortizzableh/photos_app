import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../photos.dart';

class PhotoDetailScreen extends StatelessWidget {
  const PhotoDetailScreen({
    Key? key,
    required this.photo,
  }) : super(key: key);
  static const routeName = 'photo-detail';
  final PhotoModel photo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        top: false,
        bottom: false,
        child: SizedBox.expand(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox.expand(
                child: NetworkFadingImage(
                  path: photo.regularPhotoUrl,
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: kToolbarHeight * 2,
                    minWidth: size.width,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.75),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.70),
                          Colors.black.withOpacity(0.20),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 26.0,
                        right: 26.0,
                        top: 33.0,
                        bottom: 49.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            photo.title,
                            style: textTheme.headline2?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 13.0),
                          Text(
                            '${photo.likes} likes',
                            style: textTheme.subtitle1?.copyWith(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 26.0),
                          UserTileOnPhotosDetailPage(
                            photoAuthor: photo.photoAuthor,
                            textTheme: textTheme,
                          ),
                          const SizedBox(height: 26.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Positioned(
                top: 59.0,
                left: 26.0,
                child: CloseFullScreenButton(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
