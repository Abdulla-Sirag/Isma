import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:isma/features/authentication/screens/password_configuration/reset_password.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(IsmaSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Headings
              Text (IsmaTexts.forgetPasswordTitle, style: Theme. of (context).textTheme.headlineMedium,),
              const SizedBox (height: IsmaSizes.spaceBtwItems),

              Text (IsmaTexts.forgetPasswordSubTitle, style: Theme. of (context).textTheme.labelMedium,),
              const SizedBox (height: IsmaSizes.spaceBtwSections * 2),

              /// Text Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: IsmaTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right,
                  ),
                ),
              ),
              const SizedBox (height: IsmaSizes.spaceBtwSections),
              /// Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.offAll(const ResetPassword()),
                    child: const Text(IsmaTexts.submit)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
