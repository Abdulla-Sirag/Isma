import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isma/features/authentication/controllers/onboarding_controller.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: IsmaImages.onBoardingImage1,
                title: IsmaTexts.onBoardingTitle1,
                subTitle: IsmaTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: IsmaImages.onBoardingImage2,
                title: IsmaTexts.onBoardingTitle2,
                subTitle: IsmaTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: IsmaImages.onBoardingImage3,
                title: IsmaTexts.onBoardingTitle3,
                subTitle: IsmaTexts.onBoardingSubTitle3,
              ),
            ], // Column
          ), // PageView
          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation Smooth Page Indicator
          const OnBoardingDotNavigation(),
          /// Circular Button
    const OnBoardingNextButton(),
        ],
      ), // Stack
    );
  }
}




