class IsmaFirebaseAuthException implements Exception {
  /// The error code associated with the exception.
  final String code;

  /// Constructor that takes an error code.
  IsmaFirebaseAuthException(this.code);

  /// Get the corresponding error message based on the error code.
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'Invalid login details. User not found.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'email-already-exists':
        return 'The email address already exists. Please use a different email.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
    // Additional cases
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please check Firebase documentation for allowed actions.';
      case 'too-many-requests':
        return 'Too many requests in a short time. Please try again later.';
      case 'network-request-failed':
        return 'Network error occurred. Please check your internet connection and try again.';
      case 'invalid-credential':
        return 'The provided credential is invalid. Please check the credential format.';
      case 'user-mismatch':
        return 'The provided credential does not correspond to an existing user.';
      case 'missing-verification-code':
        return 'Missing verification code. Please enter the code sent to your email or phone.';
      case 'unsupported-token-type':
        return 'The provided token type is not supported. Please check the documentation for supported token types.';
      case 'invalid-api-key':
        return 'The provided API key is invalid. Please check your Firebase project configuration.';
      case 'invalid-user-token':
        return 'The provided user token is invalid or expired. Please re-authenticate.';
      case 'session-expired':
        return 'The user session has expired. Please sign in again.';
      default:
        return 'An Unexpected Firebase error occurred. Please try again.';
    }
  }
}