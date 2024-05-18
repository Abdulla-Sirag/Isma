


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isma/features/authentication/screens/onboarding/onboarding.dart';
import 'package:isma/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: IsmaAppTheme.lightTheme,
      darkTheme: IsmaAppTheme.darkTheme,
      home: const OnBoardingScreen(),

    );
  }
}