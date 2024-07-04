import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:isma/utils/constants/colors.dart';

import '../../../utils/helpers/helper_functions.dart';



class IsmaLoaders {

  static hideSnackBar() => ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
              color: IsmaHelperFunctions.isDarkMode(Get.context!)
                  ? IsmaColors.darkGrey.withOpacity(0.9)
                  : IsmaColors.grey.withOpacity(0.9),
              borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Text(message, style: Theme.of(Get.context!).textTheme.labelLarge,),
          ),
        ),
      )
    );
  }


  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
          title,
          message,
          isDismissible: true,
          shouldIconPulse: true,
          colorText: Colors.white,
          duration: Duration(seconds: duration),
          backgroundColor: IsmaColors.primary,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          icon: Icon(Iconsax.check, color: IsmaColors.white,)
    );
  }


static warningSnackBar({required title, message = ''}) {
  Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      icon: Icon(Iconsax.warning_2, color: IsmaColors.white,)
  );
}


static errorSnackBar({required title, message = ''}) {
  Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      icon: Icon(Iconsax.warning_2, color: IsmaColors.white,)
  );
}
}
