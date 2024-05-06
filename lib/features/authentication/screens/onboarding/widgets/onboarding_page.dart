import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subTitle
  });

  final String image, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(IsmaSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: IsmaHelperFunctions.screenWidth() * 0.8,
            height: IsmaHelperFunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ), // Image
          Text (title, style: Theme. of (context).textTheme.headlineMedium, textAlign: TextAlign.center),
          const SizedBox (height: IsmaSizes.spaceBtwItems),
          Text (subTitle, style: Theme. of (context).textTheme.bodyMedium, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}