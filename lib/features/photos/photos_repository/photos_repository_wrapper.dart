part of 'photos_repository.dart';

class PhotosRepositoryWrapper extends StatefulWidget {
  const PhotosRepositoryWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  State<PhotosRepositoryWrapper> createState() =>
      _PhotosRepositoryWrapperState();
}

class _PhotosRepositoryWrapperState extends State<PhotosRepositoryWrapper> {
  late final Dio _dio;
  @override
  void initState() {
    _dio = Dio();
    super.initState();
  }

  @override
  void dispose() {
    _dio.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<PhotosRepository>(
      create: (context) => UnsplashPhotosRepository(_dio),
      child: widget.child,
    );
  }
}
