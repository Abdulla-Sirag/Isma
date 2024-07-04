import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';




class IsmaTermsAndConditionCheckbox extends StatelessWidget {
  const IsmaTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = IsmaHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(height: 24, width: 20, child: Obx (() => Checkbox(value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
        )),
        const SizedBox(width: IsmaSizes.spaceBtwItems),
        Text.rich(TextSpan(
            children: [
              TextSpan(text: '${IsmaTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: '${IsmaTexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? IsmaColors.white : IsmaColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? IsmaColors.white : IsmaColors.primary,
              )),
              TextSpan(text: '${IsmaTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: '${IsmaTexts.termsOfUse} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? IsmaColors.white : IsmaColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? IsmaColors.white : IsmaColors.primary,
              )),
            ]
        ),),
      ],
    );
  }
}