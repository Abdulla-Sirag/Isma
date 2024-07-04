


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:isma/features/authentication/screens/login/login.dart';
import 'package:isma/features/authentication/screens/onboarding/onboarding.dart';
import 'package:isma/features/authentication/screens/signup/verify_email.dart';
import 'package:isma/features/shop/screens/home/home.dart';
import 'package:isma/features/shop/screens/store/store.dart';

import '../../../navigation_menu.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {

    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  void screenRedirect() async {

    final user = _auth.currentUser;
    if(user != null) {
      if(user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email,));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }



  /* ---------------------------------------- Email & Password Sign-In ---------------------------------------- */

  /// Email Authentication - Sign In
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw IsmaFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw IsmaFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const IsmaFormatException();
    } on PlatformException catch (e) {
      throw IsmaPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }

  /// Email Authentication - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw IsmaFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw IsmaFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const IsmaFormatException();
    } on PlatformException catch (e) {
      throw IsmaPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }

  /// ReAuthenticate - ReAuthenticate User

  /// Email Verification - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw IsmaFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw IsmaFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const IsmaFormatException();
    } on PlatformException catch (e) {
      throw IsmaPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }


  /// Email Authentication - Forget Password
  Future<void> sendPassowrdResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw IsmaFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw IsmaFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const IsmaFormatException();
    } on PlatformException catch (e) {
      throw IsmaPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }

  /* ---------------------------------------- Federated Identity & Social Sign Up ---------------------------------------- */

  /// Google Authentication - Google
  Future<UserCredential> signInWithGoogle() async {
    try {

      // Trigger the auth flow
      final GoogleSignInAccount?  userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );


      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credential);


    } on FirebaseAuthException catch (e) {
      throw IsmaFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw IsmaFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const IsmaFormatException();
    } on PlatformException catch (e) {
      throw IsmaPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }

  /// Facebook Authentication - Facebook

  /* ---------------------------------------- ./end Federated Identity & Social Sign Up ---------------------------------------- */

  /// Logout User - Valid for any authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw IsmaFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw IsmaFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const IsmaFormatException();
    } on PlatformException catch (e) {
      throw IsmaPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again';
    }
  }


/// Delete User - Remove user Auth and Firestore A  ccount


}
