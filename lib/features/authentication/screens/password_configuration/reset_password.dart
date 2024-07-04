



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isma/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:isma/features/authentication/screens/login/login.dart';
import 'package:isma/utils/constants/text_strings.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          actions: [
            IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
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
              Text (IsmaTexts.changeYourPasswordTitle, style: Theme. of (context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox (height: IsmaSizes.spaceBtwItems),

              Text (IsmaTexts.changeYourPasswordSubTitle, style: Theme. of (context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox (height: IsmaSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(const LoginScreen()),
                    // onPressed: () => Get.to(SuccessScreen),
                    child: const Text(IsmaTexts.done)
                ),
              ),
              const SizedBox (height: IsmaSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),
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
