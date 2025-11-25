import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LightAppColors {
  LightAppColors._();

  static const background = Color.fromRGBO(255, 255, 255, 1.0);
  static const onBackground = Color.fromRGBO(31, 31, 57, 1.0);

  static const surface = Color.fromRGBO(255, 255, 255, 1.0);
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
    scaffoldBackgroundColor: LightAppColors.background,
    fontFamily: 'Poppins',

    colorScheme: const ColorScheme.light(
      primary: LightAppColors.primary,
      onPrimary: LightAppColors.textButton,
      secondary: LightAppColors.secondary,
      onSecondary: LightAppColors.textButton,

      inverseSurface: LightAppColors.background,
      onInverseSurface: LightAppColors.onBackground,

      surface: LightAppColors.surface,
      onSurface: LightAppColors.onSurface,
      onSurfaceVariant: LightAppColors.onSurfaceVariant,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        height: 33 / 22,
        color: LightAppColors.onBackground,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: LightAppColors.textButton,
        height: 24 / 16,
      ),
      titleLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: LightAppColors.onSurface,
      ),
      bodySmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: LightAppColors.onSurfaceVariant,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, height: 24 / 16),
        backgroundColor: LightAppColors.primary,
        foregroundColor: LightAppColors.textButton,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        fixedSize: Size.fromHeight(50.h)
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, height: 24 / 16),
        backgroundColor: LightAppColors.textButton,
        foregroundColor: LightAppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        side: BorderSide(color: LightAppColors.primary, width: 1.w),
        fixedSize: Size.fromHeight(50.h)
      ),
    ),
  );
}
