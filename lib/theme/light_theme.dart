import 'package:flutter/material.dart';

class LightAppColors {
  LightAppColors._();

  static const backgroundCore = Color.fromRGBO(255, 255, 255, 1.0);
  static const backgroundAdditional = Color.fromRGBO(133, 133, 151, 1.0);

  static const textHeadline = Color.fromRGBO(31, 31, 57, 1.0);
  static const textMain = Color.fromRGBO(133, 133, 151, 1.0);

  static const textButton = Color.fromRGBO(255, 255, 255, 1.0);

  static const primary = Color.fromRGBO(61, 92, 255, 1.0);
  static const secondary = Color.fromRGBO(234, 234, 255, 1.0);
}

class LightAppTheme {
  LightAppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: LightAppColors.primary,
    scaffoldBackgroundColor: LightAppColors.backgroundCore,
    fontFamily: 'Poppins',

    colorScheme: ColorScheme.light(
      primary: LightAppColors.primary,
      onPrimary: LightAppColors.textButton,
      surface: LightAppColors.backgroundAdditional,
      onSurface: LightAppColors.textMain,
      secondary: LightAppColors.secondary,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: LightAppColors.textHeadline,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: LightAppColors.textMain,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: LightAppColors.textHeadline,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: LightAppColors.textMain,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightAppColors.primary,
        foregroundColor: LightAppColors.textButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: LightAppColors.backgroundCore,
        foregroundColor: LightAppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
