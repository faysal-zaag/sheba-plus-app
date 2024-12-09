class ApiUrls {
  static const String baseApiUrl = "http://192.168.10.13:7010/api/1.0.0";
  static const String securedApiUrl = "$baseApiUrl/secured";
  static const String customerAuthApiUrl = "$baseApiUrl/auth/customer";
  static const String customersApiUrl = "$baseApiUrl/customers";

  // settings
  static const String publicSettingApiUrl = "$baseApiUrl/settings/get-default";
  
  // services
  static const String servicesApiUrl = "$baseApiUrl/modules";

  //Authentication
  static const String loginApiUrl = "$customerAuthApiUrl/login";
  static const String registerApiUrl = "$customerAuthApiUrl/sign-up/by-email";
  static const String verifyOtpApiUrl = "$customersApiUrl/verify/otp";
  static const String verifyForgetPasswordApiUrl = "$customersApiUrl/verify/forget-password";
  static const String socialLoginApiUrl = "$baseApiUrl/customer/social/login";
  static const String verifyEmailApiUrl =
      "$customersApiUrl/verify/email-verification";
  static const String verifyResetPasswordByEmail =
      "$customersApiUrl/verify/reset-password-by-email";
  static const String requestResetPasswordByEmail =
      "$customersApiUrl/request/reset-password-by-email";

  // Profile
  static const String getProfileApiUrl = "$securedApiUrl/users/profile";
  static const String getProfileImageApiUrl = "$securedApiUrl/users/profile";
  static const String updateUserApiUrl = "$getProfileApiUrl/update";
  static const String imageUploadApiUrl = "$securedApiUrl/users/profile";

  // address
  static const String addressApiUrl = "$securedApiUrl/addresses";
  static const String updateAddressApiUrl = "$addressApiUrl/update/id";

  // customer
  static const String applyReferral = "$securedApiUrl/customers/apply-referral";
  static const String changePassword = "$securedApiUrl/customers/reset-password";

  // public controller
  static const String createDeviceToken = "$baseApiUrl/firebase/device/token/create";
  static const String removeDeviceToken = "$baseApiUrl/firebase/device/token/remove";

}
