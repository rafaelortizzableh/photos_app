import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../photos.dart';

class AuthorScreen extends StatefulWidget {
  const AuthorScreen({
    Key? key,
    required this.photoAuthor,
  }) : super(key: key);
  static const routeName = 'author';
  final PhotoAuthor photoAuthor;

  @override
  State<AuthorScreen> createState() => _AuthorScreenState();
}

class _AuthorScreenState extends State<AuthorScreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // Using Delayed to read InheritedWidget without issues
    Future.delayed(Duration.zero, () => _getPhotos(context));
    _scrollController
      ..addListener(() => _getMoreData(context))
      ..addListener(_titleVisibilityListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _getMoreData(BuildContext context) {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final delta = MediaQuery.of(context).size.height * 0.20;
    if (maxScroll - currentScroll <= delta) {
      _getPhotos(context);
    }
  }

  void _titleVisibilityListener() {
    final currentScroll = _scrollController.position.pixels;
    final screenHeight = MediaQuery.of(context).size.height;
    final delta = MediaQuery.of(context).size.height * 0.9;

    if (currentScroll >= screenHeight - delta) {
      _hideTitle();
    } else {
      _showTitle();
    }
  }

  void _hideTitle() {
    if (!isTitleShown) return;
    setState(() => isTitleShown = false);
  }

  void _showTitle() {
    if (isTitleShown) return;
    setState(() => isTitleShown = true);
  }

  void _getPhotos(BuildContext context) {
    context
        .read<PhotosController>()
        .getAuthorPhotos(username: widget.photoAuthor.username);
  }

  bool isTitleShown = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).canvasColor,
        leading: CloseFullScreenButton(
          onClose: () {
            context.read<PhotosController>().resetAuthorPhotos();
          },
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSize(
                clipBehavior: Clip.hardEdge,
                curve: Curves.ease,
                duration: const Duration(milliseconds: 500),
                child: isTitleShown
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 27.0,
                              top: 59.0 - kToolbarHeight,
                              left: 26.0,
                            ),
                            child: CloseFullScreenButton(
                              onClose: () {
                                context
                                    .read<PhotosController>()
                                    .resetAuthorPhotos();
                              },
                              color: Colors.black,
                            ),
                          ),
                          UserTileOnAuthorPage(
                            photoAuthor: widget.photoAuthor,
                            textTheme: textTheme,
                          ),
                          Center(
                            widthFactor: 2.0,
                            child: Text(
                              'My Photos',
                              style: textTheme.headline2?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          const SizedBox(height: 11.0),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
              Expanded(
                child: ValueListenableBuilder<PhotosStateModel>(
                  valueListenable: context.watch<PhotosController>(),
                  builder: (context, value, _) {
                    final photos = value.authorPhotos;
                    return PhotosGrid(
                      photos: photos,
                      scrollController: _scrollController,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
