import 'package:flutter/material.dart';

class DarkAppColors {
  DarkAppColors._();

  static const background = Color.fromRGBO(31, 31, 57, 1.0);
  static const onBackground = Color.fromRGBO(234, 234, 255, 1.0);

  static const surface = Color.fromRGBO(47, 47, 66, 1.0);
  static const onSurface = Color.fromRGBO(255, 255, 255, 1.0);
  static const onSurfaceVariant = Color.fromRGBO(184, 184, 210, 1.0);

  static const textButton = Color.fromRGBO(244, 243, 253, 1.0);

  static const primary = Color.fromRGBO(61, 92, 255, 1.0);
  static const secondary = Color.fromRGBO(133, 133, 151, 1.0);
}

class DarkAppTheme {
  DarkAppTheme._();

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: DarkAppColors.primary,
    scaffoldBackgroundColor: DarkAppColors.background,
    fontFamily: 'Poppins',

    colorScheme: const ColorScheme.dark(
      primary: DarkAppColors.primary,
      onPrimary: DarkAppColors.textButton,
      secondary: DarkAppColors.secondary,
      onSecondary: DarkAppColors.textButton,

      inverseSurface: DarkAppColors.background,
      onInverseSurface: DarkAppColors.onBackground,

      surface: DarkAppColors.surface,
      onSurface: DarkAppColors.onSurface,
      onSurfaceVariant: DarkAppColors.onSurfaceVariant,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        height: 33 / 22,
        color: DarkAppColors.onBackground,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: DarkAppColors.textButton,
        height: 24 / 16,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: DarkAppColors.onSurface,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: DarkAppColors.onSurfaceVariant,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 24 / 16),
        backgroundColor: DarkAppColors.primary,
        foregroundColor: DarkAppColors.textButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 24 / 16),
        backgroundColor: DarkAppColors.secondary,
        foregroundColor: DarkAppColors.textButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: DarkAppColors.secondary, width: 1),
      ),
    ),
  );
}
