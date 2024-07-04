import 'package:flutter/material.dart';
import 'package:isma/features/authentication/controllers/onboarding/onboarding_controller.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
   const OnBoardingNextButton({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = IsmaHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: IsmaDeviceUtils.getBottomNavigationBarHeight() + 8,
      right: IsmaSizes.defaultSpace,
      child: TextButton(onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark ? IsmaColors.primary : Colors.black),
        child: const Icon(Icons.keyboard_arrow_right_outlined ),),);
  }
}