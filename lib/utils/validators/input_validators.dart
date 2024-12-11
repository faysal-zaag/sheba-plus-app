import 'package:intl_phone_field/phone_number.dart';

class InputValidators {
  /// General validator to check if the value is empty
  static String? generalValidator({required String? value, required String message}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  /// Validator for passwords
  static String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Password should not be empty";
    } else if (value.length < 8) {
      return "Password should have a minimum of 8 characters";
    }
    return null;
  }

  /// Validator for confirming passwords
  static String? confirmPasswordValidator(String? value, String? password) {
    if (value == null || value.trim().isEmpty) {
      return "Confirm password should not be empty";
    } else if (value.length < 8) {
      return "Confirm password should have a minimum of 8 characters";
    } else if (value != password) {
      return "Passwords do not match";
    }
    return null;
  }

  /// Validator for email addresses
  static String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email should not be empty";
    }
    // Regular expression for validating email addresses
    const emailPattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);
    if (!regex.hasMatch(value)) {
      return "Enter a valid email address";
    }
    return null;
  }

  static String? phoneNumberValidator
        ({required PhoneNumber? value, required int validationNumberLength}) {
      if (value != null && value.number.isEmpty) {
        return "Phone number required";
      } else if (value?.number.length != validationNumberLength) {
        return "Phone number should container $validationNumberLength digits";
      }
      return null;
    }
}
