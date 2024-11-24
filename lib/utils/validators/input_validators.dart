class InputValidators{
  static String? generalValidator({required String? value, required String message}){
    if(value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  static String? passwordValidator(value) {
    if (value == null || value == "") {
      return "Password should not be empty";
    } else if (value.length < 8) {
      return "Password should have minimum 8 characters";
    }
    return null;
  }

  static String? confirmPasswordValidator(value, password) {
    if (value == null || value == "") {
      return "Confirm password should not be empty";
    } else if (value.length < 8) {
      return "Confirm password should have minimum 8 characters";
    } else if (value != password) {
      return "Password did not match";
    }
    return null;
  }
}