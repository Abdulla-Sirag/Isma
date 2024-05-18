



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isma/common/widgets/success_screen/success_screen.dart';
import 'package:isma/features/authentication/screens/login/login.dart';
import 'package:isma/utils/constants/text_strings.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => Get.offAll(const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ]
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(IsmaSizes.defaultSpace),
          child: Column(
            children: [

              /// Image
              Image(
                width: IsmaHelperFunctions.screenWidth() * 0.6 ,
                  image: const AssetImage(IsmaImages.onBoardingImage1),
              ),

              const SizedBox (height: IsmaSizes.spaceBtwSections),

              /// Title & SubTitle
              Text (IsmaTexts.confirmEmail, style: Theme. of (context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox (height: IsmaSizes.spaceBtwItems),

              Text ('3body818@gmail.com', style: Theme. of (context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox (height: IsmaSizes.spaceBtwItems),

              Text (IsmaTexts.confirmEmailSubTitle, style: Theme. of (context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox (height: IsmaSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(SuccessScreen(
                      image: IsmaImages.onBoardingImage1,
                      title: IsmaTexts.yourAccountCreatedTitle,
                      subTitle: IsmaTexts.yourAccountCreatedSubTitle,
                      onPressed: () => Get.to(const LoginScreen()))),
                    child: const Text(IsmaTexts.tContinue)
                ),
              ),
              const SizedBox (height: IsmaSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(IsmaTexts.resendEmail)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
