import 'package:flutter/material.dart';

import 'core/core.dart';
import 'features/features.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PhotosControllerWrapper(
      child: MaterialApp(
        title: 'Photos App',
        theme: CustomTheme.lightTheme(),
        themeMode: ThemeMode.light,
        navigatorKey: AppConstants.navigationKey,
        onGenerateRoute: AppRouter.generateMaterialPageRoute,
        initialRoute: PhotosScreen.routeName,
      ),
    );
  }
}
