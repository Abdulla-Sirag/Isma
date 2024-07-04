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
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/login/login_controller.dart';



class IsmaLoginForm extends StatelessWidget {
  const IsmaLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final darkMode = IsmaHelperFunctions.isDarkMode(context);

    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: IsmaSizes.spaceBtwSections),
          child: Column(
            children: [

              /// Email
              TextFormField(
                controller: controller.email,
                validator: (value) => IsmaValidator.validateEmail(value),
                decoration: const InputDecoration(
                  labelText: IsmaTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right,
                  ),
                ),
              ),
              const SizedBox(height: IsmaSizes.spaceBtwInputFields),

              /// Password
              Obx(
                    () => TextFormField(
                  controller: controller.password,
                  validator: (value) => IsmaValidator.validateEmptyText('Password' ,value),
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
              const SizedBox(height: IsmaSizes.spaceBtwInputFields / 2),

              /// Remember Me & Forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx (() => Checkbox(value: controller.rememberMe.value,
                      onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value),),
                  const Text(IsmaTexts.rememberMe),
                  const Spacer(),
                  TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(IsmaTexts.forgetPassword),
                  ),
                ],
              ),
              const SizedBox(height: IsmaSizes.spaceBtwSections),


              /// Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: const Text(IsmaTexts.signIn)
                ),
              ),
              const SizedBox(height: IsmaSizes.spaceBtwItems),

              /// Create Account Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignupScreen()),
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