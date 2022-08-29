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
    Future.delayed(Duration.zero, () => _getPhotos(context));
    _scrollController.addListener(() => _getMoreData(context));

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

  void _getPhotos(BuildContext context) {
    context.read<PhotosController>().getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(
          child: ListTile(
            leading: const Icon(Icons.info),
            title: const Text(
              'About',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              showAboutDialog(
                context: context,
                applicationName: 'Photos App',
              );
            },
          ),
        ),
      ),
      appBar: const PhotosAppBar(),
      body: ValueListenableBuilder<PhotosStateModel>(
        valueListenable: context.watch<PhotosController>(),
        builder: (context, value, _) {
          if (value.failure != null) {
            return Center(
              child: Column(
                children: [
                  const Text(
                    'Error',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    value.failure?.message ?? 'Something went wrong',
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      context.read<PhotosController>().resetError();
                      _getPhotos(context);
                    },
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }
          return PhotosGrid(
            scrollController: _scrollController,
            photos: value.photos,
          );
        },
      ),
    );
  }
}
