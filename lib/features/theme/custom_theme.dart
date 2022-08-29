import 'package:flutter/material.dart'
    show AppBarTheme, Colors, FontWeight, ThemeData;

class CustomTheme {
  static const double _appBarElevation = 0;

  /// Main Theme Font
  ///
  /// Note (Museo Sans is a paid Adobe Font. Raleway is used as an alternative)
  static const String _raleWay = 'Raleway';

  // static ThemeData darkTheme() {
  //   final theme = ThemeData.dark();
  //   final textTheme = theme.primaryTextTheme;
  //   return ThemeData(
  //     primaryColor: Colors.white,
  //     scaffoldBackgroundColor: Colors.black,
  //     appBarTheme: const AppBarTheme(
  //       elevation: _appBarElevation,
  //       color: Colors.black,
  //     ),
  //     textTheme: theme.primaryTextTheme
  //         .copyWith(
  //           headline2: textTheme.headline2?.copyWith(
  //             fontSize: 42.0,
  //           ),
  //           subtitle1: textTheme.subtitle1?.copyWith(
  //             fontSize: 22.0,
  //             fontWeight: FontWeight.w500,
  //           ),
  //           bodyText1: textTheme.subtitle1?.copyWith(
  //             fontSize: 12.0,
  //             fontWeight: FontWeight.w400,
  //           ),
  //           bodyText2: textTheme.subtitle1?.copyWith(
  //             fontSize: 10.0,
  //             fontWeight: FontWeight.w300,
  //           ),
  //         )
  //         .apply(
  //           displayColor: Colors.white,
  //         ),
  //   );
  // }

  static ThemeData lightTheme() {
    final theme = ThemeData.light();
    final textTheme = theme.primaryTextTheme;
    return ThemeData(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        elevation: _appBarElevation,
        color: Colors.white,
      ),
      canvasColor: Colors.white,
      bottomAppBarColor: Colors.white,
      textTheme: theme.primaryTextTheme
          .copyWith(
            headline2: textTheme.headline2?.copyWith(
              fontSize: 42.0,
            ),
            subtitle1: textTheme.subtitle1?.copyWith(
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
            ),
            bodyText1: textTheme.subtitle1?.copyWith(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
            bodyText2: textTheme.subtitle1?.copyWith(
              fontSize: 10.0,
              fontWeight: FontWeight.w300,
            ),
          )
          .apply(
            displayColor: Colors.black,
            fontFamily: _raleWay,
          ),
    );
  }
}
