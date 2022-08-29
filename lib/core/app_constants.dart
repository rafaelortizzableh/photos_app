import 'package:flutter/widgets.dart' show GlobalKey, NavigatorState;

class AppConstants {
  static const String unsplashApiKey = String.fromEnvironment('PHOTOS_API');
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  static const double borderRadius = 8.0;
  static const double mediumSpacing = 24.0;
  static const double horizontalPadding = 12.0;
  static const double listItemSpacing = 8.0;
}
