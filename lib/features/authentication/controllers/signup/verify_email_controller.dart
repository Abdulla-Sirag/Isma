import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:isma/common/widgets/success_screen/success_screen.dart';
import 'package:isma/data/reopsitories/authentication/authentication_repository.dart';
import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';



class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Set Timer fro auto redirect.
  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    setTimerForAutoRedirect();
  }

  /// Send Email Verification Link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      IsmaLoaders.successSnackBar(
          message: 'Please Check your inbox and verify your email.',
          title: 'Email Sent');
    } catch (e) {
      IsmaLoaders.errorSnackBar(message: e.toString(), title: 'Oh Snap!');
    }
  }

  /// Timer to automatically redirect an Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
              image: IsmaImages.successfulRegisteration,
              title: IsmaTexts.yourAccountCreatedTitle,
              subTitle: IsmaTexts.yourAccountCreatedSubTitle,
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect()),
        );
      }
    });
  }

  /// Manually Check if Email Verified
  checkEmailVerificationStatus() async {

    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
            () => SuccessScreen(
            image: IsmaImages.successfulRegisteration,
            title: IsmaTexts.yourAccountCreatedTitle,
            subTitle: IsmaTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()),
      );
    }
  }
}
