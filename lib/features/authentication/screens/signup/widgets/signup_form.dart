import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/features/authentication/controllers/signup/signup_controller.dart';
import 'package:isma/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:isma/utils/validators/validation.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../verify_email.dart';

class IsmaSignupForm extends StatelessWidget {
  const IsmaSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        IsmaValidator.validateEmptyText('First name', value),
                    decoration: const InputDecoration(
                      labelText: IsmaTexts.firstName,
                      prefixIcon: Icon(
                        Iconsax.user,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: IsmaSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        IsmaValidator.validateEmptyText('Last name', value),
                    decoration: const InputDecoration(
                      labelText: IsmaTexts.lastName,
                      prefixIcon: Icon(
                        Iconsax.user_edit,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: IsmaSizes.spaceBtwInputFields),
              ],
            ),
            const SizedBox(height: IsmaSizes.spaceBtwInputFields),
            TextFormField(
              controller: controller.email,
              validator: (value) => IsmaValidator.validateEmail(value),
              decoration: const InputDecoration(
                labelText: IsmaTexts.email,
                prefixIcon: Icon(
                  Iconsax.direct,
                ),
              ),
            ),
            const SizedBox(height: IsmaSizes.spaceBtwInputFields),
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => IsmaValidator.validatePhoneNumber(value),
              decoration: const InputDecoration(
                labelText: IsmaTexts.phoneNo,
                prefixIcon: Icon(
                  Iconsax.call,
                ),
              ),
            ),
            const SizedBox(height: IsmaSizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => IsmaValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: IsmaTexts.password,
                    prefixIcon: Icon(
                      Iconsax.password_check,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye),),),
              ),
            ),
            const SizedBox(height: IsmaSizes.spaceBtwInputFields),
            const IsmaTermsAndConditionCheckbox(),
            const SizedBox(height: IsmaSizes.spaceBtwSections),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.signup(),
                  child: const Text(IsmaTexts.createAccount)),
            ),
          ],
        ));
  }
}
