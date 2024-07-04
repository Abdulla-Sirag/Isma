/// Custom exception class to handle various format-related errors.
class IsmaFormatException implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const IsmaFormatException([this.message = 'An unexpected format error occurred. Please check your input.']);

  /// Create a format exception from a specific error message.
  factory IsmaFormatException.fromMessage(String message) {
    return IsmaFormatException(message);
  }

  /// Get the corresponding error message.
  String get formattedMessage => message;

  /// Create a format exception from a specific error code.
  factory IsmaFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return const IsmaFormatException('The email address format is invalid. Please enter a valid email.');
      case 'invalid-phone-number-format':
        return const IsmaFormatException('The provided phone number format is invalid. Please enter a valid number.');
      case 'invalid-date-format':
        return const IsmaFormatException('The date format is invalid. Please enter a valid date.');
      case 'invalid-url-format':
        return const IsmaFormatException('The URL format is invalid. Please enter a valid URL.');
      case 'invalid-credit-card-format':
        return const IsmaFormatException('The credit card format is invalid. Please enter a valid credit card number.');
      case 'invalid-numeric-format':
        return const IsmaFormatException('The input should be in a valid numeric format.');
      default:
        return const IsmaFormatException();
    }
  }
}
