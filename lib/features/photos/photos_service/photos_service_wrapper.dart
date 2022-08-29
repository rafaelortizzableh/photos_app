part of 'photos_service.dart';

class PhotosServiceWrapper extends StatelessWidget {
  const PhotosServiceWrapper({
    Key? key,
    required this.child,
    required this.photosRepository,
  }) : super(key: key);
  final Widget child;
  final PhotosRepository photosRepository;

  @override
  Widget build(BuildContext context) {
    return Provider<PhotosService>(
      create: (context) => RemotePhotoService(photosRepository),
      child: child,
    );
  }
}
