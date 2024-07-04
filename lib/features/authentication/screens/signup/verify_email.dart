import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isma/common/widgets/success_screen/success_screen.dart';
import 'package:isma/data/reopsitories/authentication/authentication_repository.dart';
import 'package:isma/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:isma/features/authentication/screens/login/login.dart';
import 'package:isma/utils/constants/text_strings.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear))
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

              Text (email ?? '', style: Theme. of (context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox (height: IsmaSizes.spaceBtwItems),

              Text (IsmaTexts.confirmEmailSubTitle, style: Theme. of (context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox (height: IsmaSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text(IsmaTexts.tContinue)
                ),
              ),
              const SizedBox (height: IsmaSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.sendEmailVerification(),
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
