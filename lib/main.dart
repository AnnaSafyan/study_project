import 'package:flutter/material.dart';

import 'package:study_project/onboarding.dart';
import 'package:study_project/theme/dark_theme.dart';
import 'package:study_project/theme/light_theme.dart';

import 'examples/_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: DarkAppTheme.darkTheme,
      // theme: LightAppTheme.lightTheme,
      home: const OnboardingScreen(),
    );
  }
}
