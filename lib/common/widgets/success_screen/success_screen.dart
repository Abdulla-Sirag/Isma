import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../styles/ispacing_styles.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  IsmaSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Image
              Image(
                width: IsmaHelperFunctions.screenWidth() * 0.6 ,
                image: AssetImage(image),
              ),
              const SizedBox (height: IsmaSizes.spaceBtwSections),

              /// Title & SubTitle
              Text (title, style: Theme. of (context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox (height: IsmaSizes.spaceBtwItems),

              Text (subTitle, style: Theme. of (context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox (height: IsmaSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed,
                    child: const Text(IsmaTexts.tContinue)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
