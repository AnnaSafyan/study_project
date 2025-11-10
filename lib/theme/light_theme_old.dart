import 'package:flutter/material.dart';

class LightAppColors {
  LightAppColors._();

  static const surface = Color.fromRGBO(255, 255, 255, 1.0);
  static const inverseSurface = Color.fromRGBO(133, 133, 151, 1.0);

  static const onSurface = Color.fromRGBO(31, 31, 57, 1.0);
  static const onSurfaceVariant = Color.fromRGBO(133, 133, 151, 1.0);

  static const textButton = Color.fromRGBO(255, 255, 255, 1.0);

  static const primary = Color.fromRGBO(61, 92, 255, 1.0);
  static const secondary = Color.fromRGBO(234, 234, 255, 1.0);
}

class LightAppTheme {
  LightAppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: LightAppColors.primary,
    scaffoldBackgroundColor: LightAppColors.surface,
    fontFamily: 'Poppins',

    colorScheme: ColorScheme.light(
      primary: LightAppColors.primary,
      onPrimary: LightAppColors.textButton,
      surface: LightAppColors.surface,
      onSurface: LightAppColors.onSurface,
      onSurfaceVariant: LightAppColors.onSurfaceVariant,
      secondary: LightAppColors.secondary,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: LightAppColors.onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: LightAppColors.onSurfaceVariant,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: LightAppColors.onSurface,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: LightAppColors.onSurfaceVariant,
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
        backgroundColor: LightAppColors.surface,
        foregroundColor: LightAppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
