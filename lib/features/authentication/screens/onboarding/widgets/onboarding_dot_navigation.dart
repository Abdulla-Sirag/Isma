import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding_controller.dart';

class onBoardingDotNavigation extends StatelessWidget {
  const onBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: IsmaDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: IsmaSizes.defaultSpace,
      child: SmoothPageIndicator(count: 3, controller: controller.pageController, onDotClicked: controller.dotNavigationClick, ));
  }
}