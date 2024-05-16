import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';


class IsmaCartCounterIcon extends StatelessWidget {
  const IsmaCartCounterIcon({
    super.key, required this.ismaColor, required this.onPressed, required this.isCloredBar,
  });

  final Color ismaColor;
  final VoidCallback onPressed;
  final bool isCloredBar;

  @override
  Widget build(BuildContext context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon: Icon(Iconsax.shopping_bag,
          color: isCloredBar ? IsmaColors.white : darkMode ? IsmaColors.white : IsmaColors.black)),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: isCloredBar ? ismaColor : darkMode ? IsmaColors.white : IsmaColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(
    color: isCloredBar ? IsmaColors.white : darkMode ? IsmaColors.black : IsmaColors.white, fontSizeFactor: 0.8),),
            ),
          ),
        ),
      ],
    );
  }
}

