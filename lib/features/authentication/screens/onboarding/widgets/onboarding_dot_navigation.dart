import 'package:flutter/cupertino.dart';
import 'package:isma/utils/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = IsmaHelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: IsmaDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: IsmaSizes.defaultSpace,
      child: SmoothPageIndicator(count: 3, controller: controller.pageController, onDotClicked: controller.dotNavigationClick,
      effect: WormEffect(activeDotColor: darkMode ? IsmaColors.white : IsmaColors.dark),));
  }
}