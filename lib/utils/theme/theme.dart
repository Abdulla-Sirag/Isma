

import 'package:flutter/material.dart';
import 'package:isma/utils/theme/costum_theme/bottom_sheet_theme.dart';
import 'package:isma/utils/theme/costum_theme/check_box_theme.dart';
import 'package:isma/utils/theme/costum_theme/chip_theme.dart';
import 'package:isma/utils/theme/costum_theme/elevated_button_theme.dart';
import 'package:isma/utils/theme/costum_theme/outlined_button_theme.dart';
import 'package:isma/utils/theme/costum_theme/testtheme.dart';
import 'package:isma/utils/theme/costum_theme/text_field_theme.dart';
import 'package:isma/utils/theme/costum_theme/text_theme.dart';

class IsmaAppTheme {
  IsmaAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: IsmaTextTheme.lightTextTheme,
    chipTheme: IsmaChipTheme.lightChipTheme,
    appBarTheme: IsmaAppBarTheme.lightAppBarTheme,
    checkboxTheme: IsmaCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: IsmaBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: IsmaElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: IsmaOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TextFormFielsTheme.lightInputDecorationTheme,

  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: IsmaTextTheme.darkTextTheme,
    chipTheme: IsmaChipTheme.darkChipTheme,
    appBarTheme: IsmaAppBarTheme.darkAppBarTheme,
    checkboxTheme: IsmaCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: IsmaBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: IsmaElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: IsmaOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TextFormFielsTheme.darkInputDecorationTheme,
  );
}
