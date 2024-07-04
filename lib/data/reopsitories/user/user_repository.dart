


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:isma/data/reopsitories/user/user_model.dart';
import 'package:isma/features/authentication/screens/login/login.dart';
import 'package:isma/features/authentication/screens/onboarding/onboarding.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  /// Variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      return await _db.collection("users").doc(user.id).set(user.toJson());
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

/// Function to fetch user details based on your ID

/// Function to update user data in Firestore

/// Updadte any field in specific users collection

/* ---------------------------------------- Federated Identity & Social Sign Up ---------------------------------------- */

/// Google Authentication - Google

/// Facebook Authentication - Facebook

/* ---------------------------------------- ./end Federated Identity & Social Sign Up ---------------------------------------- */

/// Logout User - Valid for any authentication

/// Delete User - Remove user Auth and Firestore A  ccount


}
