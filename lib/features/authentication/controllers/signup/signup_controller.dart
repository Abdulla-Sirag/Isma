import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:isma/common/widgets/loaders/full_screen_loader.dart';
import 'package:isma/common/widgets/loaders/loaders.dart';
import 'package:isma/data/reopsitories/authentication/authentication_repository.dart';
import 'package:isma/data/reopsitories/user/user_model.dart';
import 'package:isma/data/reopsitories/user/user_repository.dart';
import 'package:isma/features/authentication/screens/signup/verify_email.dart';

import '../../../../data/services/network_manager.dart';
import '../../../../utils/constants/image_strings.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Signup
  void signup() async {
    try {

      // Start Loading
      IsmaFullScreenLoader.openLoadingDialog('We are processing your information', IsmaImages.decorAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected) {
        // Todo: check why the snackbar not working in catch brackets? is it bc there should be really no internet?
        IsmaLoaders.errorSnackBar(message: 'No internet connection!', title: 'Oh Snap!');
        // Remove Loader
        IsmaFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!signupFormKey.currentState!.validate()) {
        // Remove Loader
        IsmaFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if(!privacyPolicy.value) {
        IsmaLoaders.warningSnackBar(title: 'Accept Privacy Policy',
        message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of use.',);
        // Remove Loader
        IsmaFullScreenLoader.stopLoading();
        return;
      }

      // Register user in the Firebase Authentication & and Save user data in the Firebase
      final userCredentials = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(id: userCredentials.user!.uid, firstName: firstName.text.trim(), lastName: lastName.text.trim(), userName: userName.text.trim(), email: email.text.trim(), phoneNumber: phoneNumber.text.trim(), profilePicture: ' ');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      IsmaFullScreenLoader.stopLoading();

      // Show Success Message
      IsmaLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue.',);


      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim(),));

    } catch (e) {

      // Show some Generic Error to the user
      throw 'something went wrong, please try again';


    } finally {

      // TODO: why this method intercept VerifyEmailScreen? should be fixed
      // // Remove Loader
      // IsmaFullScreenLoader.stopLoading();
    }
  }
}
