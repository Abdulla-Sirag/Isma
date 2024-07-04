


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isma/bindings/general_bindings.dart';
import 'package:isma/features/authentication/screens/onboarding/onboarding.dart';
import 'package:isma/utils/constants/colors.dart';
import 'package:isma/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: IsmaAppTheme.lightTheme,
      darkTheme: IsmaAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      /// Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen.
      home: const Scaffold(backgroundColor: IsmaColors.primary, body: Center(child: CircularProgressIndicator(color: IsmaColors.white,),),),

    );
  }
}