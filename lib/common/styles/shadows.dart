import 'package:flutter/material.dart';
import 'package:isma/utils/constants/colors.dart';


class IsmaShadowsStyle {

  static final verticalProductShadow = BoxShadow(
    color: IsmaColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  static final horizontalProductShadow = BoxShadow(
    color: IsmaColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}

