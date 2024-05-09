import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/utils/constants/Image_strings.dart';
import 'package:isma/utils/constants/colors.dart';
import 'package:isma/utils/constants/sizes.dart';
import 'package:isma/utils/constants/text_strings.dart';
import 'features/authentication/screens/signup/signup.dart';
import 'navigation_menu.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// SizedBox
        const SizedBox(height: IsmaSizes.spaceBtwItems),

        /// Text Widget:
        Text (IsmaTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: IsmaColors.grey),),

        /// TextFormField
        TextFormField(
          decoration: const InputDecoration(
              labelText: IsmaTexts.password,
              prefixIcon: Icon(Iconsax.password_check,
              ),
              suffixIcon: Icon(Iconsax.eye_slash)
          ),
        ),

        /// Elevated Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () => Get.to(const NavigationMenu()),
              child: const Text(IsmaTexts.signIn)
          ),
        ),

        /// Outlined Button
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
              // foregroundColor: darkMode ? IsmaColors.white.withOpacity(0.9) : IsmaColors.black, // Change the color here
            ),
            child: const Text(IsmaTexts.createAccount),
          ),
        ),

        /// Container & IconButton
        Container(
          decoration: BoxDecoration(border: Border.all(color: IsmaColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            icon: const Image(
              width: IsmaSizes.iconMd,
              height: IsmaSizes.iconMd,
              image: AssetImage(IsmaImages.google),
            ),
            onPressed: () {
              // Implement Facebook Sign In functionality
            },
          ),
        ),
      ],
    );
  }
}
