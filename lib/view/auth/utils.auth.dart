class AuthUtils{
  static int getVerificationTime() {
    return DateTime.now()
        .add(
      const Duration(minutes: 3),
    )
        .millisecondsSinceEpoch;
  }

  static String getSecuredPhoneNumber({required String phoneNumber}) {
    List<String> characters = phoneNumber.split("");
    for (int i = 0; i < characters.length; i++) {
      if (i > 5 && i < phoneNumber.length - 2) {
        characters[i] = "*";
      }
    }
    return characters.join("");
  }


  static String getSecuredEmail({required String email}) {
    List<String> parts = email.split('@');
    List<String> localPart = parts[0].split("");

    for (int i = 0; i < localPart.length; i++) {
      if (i > 3 && i < localPart.length - 2) {
        localPart[i] = "*";
      }
    }

    String maskedPart = localPart.join("");
    return '$maskedPart@${parts.last}';
  }
}