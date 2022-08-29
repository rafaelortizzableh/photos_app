import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../photos.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({Key? key}) : super(key: key);
  static const routeName = 'photos';

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // Using Delayed to read InheritedWidget without issues
    Future.delayed(Duration.zero, () => getPhotos(context));
    _scrollController.addListener(() => getMoreData(context));
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void getMoreData(BuildContext context) {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final delta = MediaQuery.of(context).size.height * 0.20;
    if (maxScroll - currentScroll <= delta) {
      getPhotos(context);
    }
  }

  void getPhotos(BuildContext context) {
    context.read<PhotosController>().getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PhotosAppBar(),
      body: ValueListenableBuilder<PhotosStateModel>(
        valueListenable: context.watch<PhotosController>(),
        builder: (context, value, _) {
          return PhotosGrid(
            scrollController: _scrollController,
            photos: value.photos,
          );
        },
      ),
    );
  }
}
