import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:isma/features/authentication/screens/signup/signup.dart';
import 'package:isma/utils/constants/sizes.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';



class IsmaLoginForm extends StatelessWidget {
  const IsmaLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: IsmaSizes.spaceBtwSections),
          child: Column(
            children: [


              /// Text Form Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: IsmaTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right,
                  ),
                ),
              ),
              const SizedBox(height: IsmaSizes.spaceBtwInputFields),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: IsmaTexts.password,
                    prefixIcon: Icon(Iconsax.password_check,
                    ),
                    suffixIcon: Icon(Iconsax.eye_slash)
                ),
              ),
              const SizedBox(height: IsmaSizes.spaceBtwInputFields / 2),

              /// Remember Me & Forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text(IsmaTexts.rememberMe),
                  const Spacer(),
                  TextButton(
                    onPressed: () => Get.to(const ForgetPassword()),
                    child: const Text(IsmaTexts.forgetPassword),
                  ),
                ],
              ),
              const SizedBox(height: IsmaSizes.spaceBtwSections),


              /// Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(const NavigationMenu()),
                    child: const Text(IsmaTexts.signIn)
                ),
              ),
              const SizedBox(height: IsmaSizes.spaceBtwItems),

              /// Create Account Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: () => Get.to(const SignupScreen()),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
                    ),
                    textStyle: const TextStyle(
                      // Customize text style (optional)
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    foregroundColor: darkMode ? IsmaColors.white.withOpacity(0.9) : IsmaColors.black, // Change the color here
                  ),
                  child: const Text(IsmaTexts.createAccount),
                ),
              ),
            ],
          ),
        ));

  }
}