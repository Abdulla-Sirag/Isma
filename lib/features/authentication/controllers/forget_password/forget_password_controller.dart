import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:isma/data/reopsitories/authentication/authentication_repository.dart';

import '../../../../common/widgets/loaders/full_screen_loader.dart';
import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../data/services/network_manager.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../screens/password_configuration/reset_password.dart';




class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();


  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();


  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {

      // Start Loading
      IsmaFullScreenLoader.openLoadingDialog('Processing your request ...', IsmaImages.decorAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected) {

        // Remove Loader
        IsmaFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!forgetPasswordFormKey.currentState!.validate()) {
        // Remove Loader
        IsmaFullScreenLoader.stopLoading();
        return;
      }


      // send Email to Reset Password
      await AuthenticationRepository.instance.sendPassowrdResetEmail(email.text.trim());


      // Remove Loader
      IsmaFullScreenLoader.stopLoading();

      // Show Success Screen
      IsmaLoaders.successSnackBar(
          message: 'Email Link Sent to Reset your Password'.tr,
          title: 'Email Sent');

      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));


    } catch (e) {

      // Remove Loader
      IsmaFullScreenLoader.stopLoading();

      IsmaLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());

    }
  }

  resendPasswordResetEmail(String email) async {
    try {

      // Start Loading
      IsmaFullScreenLoader.openLoadingDialog('Processing your request ...', IsmaImages.decorAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected) {

        // Remove Loader
        IsmaFullScreenLoader.stopLoading();
        return;
      }

      // send Email to Reset Password
      await AuthenticationRepository.instance.sendPassowrdResetEmail(email);


      // Remove Loader
      IsmaFullScreenLoader.stopLoading();

      // Show Success Screen
      IsmaLoaders.successSnackBar(
          message: 'Email Link Sent to Reset your Password'.tr,
          title: 'Email Sent');


    } catch (e) {

      // Remove Loader
      IsmaFullScreenLoader.stopLoading();

      IsmaLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());

    }
  }
}