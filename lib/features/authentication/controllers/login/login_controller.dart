import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:isma/common/widgets/loaders/full_screen_loader.dart';
import 'package:isma/common/widgets/loaders/loaders.dart';
import 'package:isma/data/reopsitories/authentication/authentication_repository.dart';
import 'package:isma/features/authentication/screens/signup/verify_email.dart';
import 'package:isma/features/personalization/controllers/user_controller.dart';
import '../../../../data/services/network_manager.dart';
import '../../../../utils/constants/image_strings.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final userController = Get.put(UserController());

  /// variables
  final hidePassword = true.obs;
  final rememberMe = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// Email & Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {

      // Start Loading
      IsmaFullScreenLoader.openLoadingDialog('Logging you in ...', IsmaImages.decorAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected) {

        // Remove Loader
        IsmaFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if(!loginFormKey.currentState!.validate()) {
        // Remove Loader
        IsmaFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if(rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }


      // Login user using Email and Password Authentication
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());


      // Remove Loader
      IsmaFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {

      // Remove Loader
      IsmaFullScreenLoader.stopLoading();

      IsmaLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());

    } 
  }

  /// Google SignIn Authentication
  Future<void> googleSignIn() async {

    try {
      // Start Loading
      IsmaFullScreenLoader.openLoadingDialog('Logging you in ...', IsmaImages.decorAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if(!isConnected) {

        // Remove Loader
        IsmaFullScreenLoader.stopLoading();

        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      IsmaFullScreenLoader.stopLoading();


      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      // Remove Loader
      IsmaFullScreenLoader.stopLoading();
      IsmaLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
