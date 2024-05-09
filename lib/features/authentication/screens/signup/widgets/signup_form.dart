import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../verify_email.dart';

class IsmaSignupForm extends StatelessWidget {
  const IsmaSignupForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: IsmaTexts.firstName,
                  prefixIcon: Icon(Iconsax.user,
                  ),
                ),
              ),
            ),
            const SizedBox(width: IsmaSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: IsmaTexts.lastName,
                  prefixIcon: Icon(Iconsax.user_edit,
                  ),
                ),
              ),
            ),
            const SizedBox(height: IsmaSizes.spaceBtwInputFields),
          ],
        ),
        const SizedBox(height: IsmaSizes.spaceBtwInputFields),
        TextFormField(
          decoration: const InputDecoration(
            labelText: IsmaTexts.email,
            prefixIcon: Icon(Iconsax.direct,
            ),
          ),
        ),
        const SizedBox(height: IsmaSizes.spaceBtwInputFields),
        TextFormField(
          decoration: const InputDecoration(
            labelText: IsmaTexts.phoneNo,
            prefixIcon: Icon(Iconsax.call,
            ),
          ),
        ),
        const SizedBox(height: IsmaSizes.spaceBtwInputFields),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              labelText: IsmaTexts.password,
              prefixIcon: Icon(Iconsax.password_check,
              ),
              suffixIcon: Icon(Iconsax.eye_slash)
          ),
        ),
        const SizedBox(height: IsmaSizes.spaceBtwInputFields),
        const TermsAndConditionCheckbox(),
        const SizedBox(height: IsmaSizes.spaceBtwSections),

        // Sign In Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => Get.to(const VerifyEmailScreen()),
              child: const Text(IsmaTexts.createAccount)
          ),
        ),
      ],
    ));
  }
}

