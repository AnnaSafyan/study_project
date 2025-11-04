import 'package:flutter/material.dart';

class WhiteAppColors {
  WhiteAppColors._();

  // Dark theme
  static const backgroundDark = Color.fromRGBO(31, 31, 57, 100);
  static const surfaceDark = Color.fromRGBO(47, 47, 66, 100);

  static const textHeadlineDark = Color.fromRGBO(234, 234, 255, 100);
  static const textMainDark = Color.fromRGBO(244, 243, 253, 100);
  static const textSurfaceHeadlineDark = Color.fromRGBO(255, 255, 255, 100);
  static const textSurfaceMainDark = Color.fromRGBO(184, 184, 210, 100);

  // Light theme
  static const backgroundLight = Color.fromRGBO(255, 255, 255, 100);
  static const textHeadlineLight = Color.fromRGBO(31, 31, 57, 100);

  // General
  static const primary = Color.fromRGBO(61, 92, 255, 100);
  static const secondary = Color.fromRGBO(133, 133, 151, 100);
}

class WhiteAppTheme {
  WhiteAppTheme._();
  // Dark theme
  static final ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: WhiteAppColors.primary,
    scaffoldBackgroundColor: WhiteAppColors.backgroundDark,
    cardColor: WhiteAppColors.surfaceDark,

    fontFamily: 'Poppins',

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: WhiteAppColors.textHeadlineDark,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: WhiteAppColors.textMainDark,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: WhiteAppColors.primary,
        foregroundColor: WhiteAppColors.textMainDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: WhiteAppColors.secondary,
        foregroundColor: WhiteAppColors.textMainDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  // static final ThemeData lightTheme = ThemeData(
  //   fontFamily: 'Poppins',

  //   scaffoldBackgroundColor: Colors.greenAccent,
  //   colorScheme: ColorScheme.fromSeed(
  //     seedColor: Colors.lightBlue,
  //     brightness: Brightness.light,
  //   ),
}
