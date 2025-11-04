import 'package:flutter/material.dart';

class DarkAppColors {
  DarkAppColors._();

  static const backgroundCore = Color.fromRGBO(31, 31, 57, 1.0);
  static const backgroundAdditional = Color.fromRGBO(47, 47, 66, 1.0);

  static const textCoreHeadline = Color.fromRGBO(234, 234, 255, 1.0);
  static const textCoreMain = Color.fromRGBO(244, 243, 253, 1.0);
  static const textAdditionalHeadline = Color.fromRGBO(255, 255, 255, 1.0);
  static const textAdditionalMain = Color.fromRGBO(184, 184, 210, 1.0);

  static const textButton = Color.fromRGBO(244, 243, 253, 1.0);

  static const primary = Color.fromRGBO(61, 92, 255, 1.0);
  static const secondary = Color.fromRGBO(133, 133, 151, 1.0);
}

class DarkAppTheme {
  DarkAppTheme._();

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: DarkAppColors.primary,
    scaffoldBackgroundColor: DarkAppColors.backgroundCore,
    cardColor: DarkAppColors.backgroundAdditional,
    fontFamily: 'Poppins',

    colorScheme: const ColorScheme.dark(
      primary: DarkAppColors.primary,
      onPrimary: DarkAppColors.textButton,
      surface: DarkAppColors.backgroundAdditional,
      onSurface: DarkAppColors.textCoreMain,
      secondary: DarkAppColors.secondary,
      onSecondary: DarkAppColors.textButton,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: DarkAppColors.textCoreHeadline,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: DarkAppColors.textCoreMain,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: DarkAppColors.textAdditionalHeadline,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: DarkAppColors.textAdditionalMain,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkAppColors.primary,
        foregroundColor: DarkAppColors.textButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: DarkAppColors.secondary,
        foregroundColor: DarkAppColors.textButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
