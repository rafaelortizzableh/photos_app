import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../features/features.dart';

abstract class AppRouter {
  static Route<MaterialPageRoute> generateMaterialPageRoute(
    RouteSettings settings,
  ) {
    log(settings.name.toString());
    switch (settings.name) {
      case PhotosScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const PhotosScreen(),
          settings: settings,
        );
      case PhotoDetailScreen.routeName:
        final photo = settings.arguments as PhotoModel;
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        return PageRouteBuilder(
          pageBuilder: (context, animation, secondAnimation) =>
              PhotoDetailScreen(
            photo: photo,
          ),
          transitionsBuilder: ((context, animation, secondaryAnimation, child) {
            final tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          }),
          settings: settings,
          fullscreenDialog: true,
        );
      case AuthorScreen.routeName:
        assert(settings.arguments is PhotoAuthor);
        final photoAuthor = settings.arguments as PhotoAuthor;
        return MaterialPageRoute(
          builder: (context) => AuthorScreen(
            photoAuthor: photoAuthor,
          ),
          settings: settings,
          fullscreenDialog: true,
        );
      // case ThemeScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) => const ThemeScreen(),
      //     settings: settings,
      //   );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text('Unknown Route')),
            body: Center(
              child: Text('No path for ${settings.name}'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
