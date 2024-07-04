import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isma/features/authentication/controllers/login/login_controller.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class IsmaSocialButtons extends StatelessWidget {
  const IsmaSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: IsmaColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            icon: const Image(
              width: IsmaSizes.iconMd,
              height: IsmaSizes.iconMd,
              image: AssetImage(IsmaImages.google),
            ),
            onPressed: () => controller.googleSignIn(),
          ),
        ),
        const SizedBox(width: IsmaSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: IsmaColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            icon: const Image(
              width: IsmaSizes.iconMd,
              height: IsmaSizes.iconMd,
              image: AssetImage(IsmaImages.facebook),
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
