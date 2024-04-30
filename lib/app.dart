


import 'package:flutter/material.dart';
import 'package:isma/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: IsmaAppTheme.LightTheme,
      darkTheme: IsmaAppTheme.DarkTheme,

    );
  }
}