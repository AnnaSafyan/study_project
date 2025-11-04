import 'package:flutter/material.dart';

class DarkAppColors {
  DarkAppColors._();

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

class DarkAppTheme {
  DarkAppTheme._();

  // Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: DarkAppColors.primary,
    scaffoldBackgroundColor: DarkAppColors.backgroundDark,
    cardColor: DarkAppColors.surfaceDark,

    fontFamily: 'Poppins',

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: DarkAppColors.textHeadlineDark,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: DarkAppColors.textMainDark,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkAppColors.primary,
        foregroundColor: DarkAppColors.textMainDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: DarkAppColors.secondary,
        foregroundColor: DarkAppColors.textMainDark,
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
