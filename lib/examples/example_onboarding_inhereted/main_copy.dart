import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_project/onboarding/onboarding.dart';
import 'package:study_project/theme/dark_theme.dart';
import 'package:study_project/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          theme: DarkAppTheme.darkTheme,
          // theme: LightAppTheme.lightTheme,
          home: child,
        );
      },
      child: const OnboardingScreen(),
    );
  }
}
