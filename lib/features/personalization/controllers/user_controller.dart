import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:isma/data/reopsitories/user/user_model.dart';
import 'package:isma/data/reopsitories/user/user_repository.dart';

import '../../../common/widgets/loaders/loaders.dart';



class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Save user record from any registeration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if(userCredentials != null) {
        // Convert Name to First and Last Name
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');


        // Map Data
        final user = UserModel(id: userCredentials.user!.uid,
            firstName: nameParts[0], lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            userName: username, email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '');

        // Save user data
        await userRepository.saveUserRecord(user);



      }

  } catch (e) {

      IsmaLoaders.warningSnackBar(title: 'Data not saved',
        message: 'Something went wrong with saving your information. You can re-save your data in your profile.',);
    }

    }

}