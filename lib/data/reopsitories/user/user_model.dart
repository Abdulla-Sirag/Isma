import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:isma/utils/formatters/formatter.dart';

class UserModel {
  // Keep those values final which you don't want to update
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;


  /// Constructor for UserModel
  UserModel({required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,});

  /// Helper function to get the full name.
  String get fullName => '$firstName $lastName';

  /// Helper function to format phone number.
  String get formattedPhoneNo => IsmaFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Static function to generate a user name form the full name.
  static String generateUsername(fullName) {

    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsermane = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsermane";

    return usernameWithPrefix;
  }

  /// Static function to create an empty user model
  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', userName: '',  email: '', phoneNumber: '', profilePicture: '');

  /// Convert model to JSON to store in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'firstName' : firstName,
      'lastName' : lastName,
      'userName' : userName,
      'email' : email,
      'phoneNumber' : phoneNumber,
      'profilePicture' : profilePicture,
    };
  }

  /// Factory method to create a UserModel from a firebase document snapshot.
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data['firstName'] ?? ' ',
          lastName: data['lastName'] ?? ' ' ,
          userName: data['userName'] ?? ' ' ,
          email: data['email'] ?? ' ' ,
          phoneNumber: data['phoneNumber'] ?? ' ' ,
          profilePicture: data['profilePicture'] ?? ' ' );
    } else {
      // TODO: this line i added my self so i have to chech the consequence later on.
      throw Exception('Document snapshot data is null');
    }
  }

}