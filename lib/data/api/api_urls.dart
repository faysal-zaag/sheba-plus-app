class ApiUrls {
  static const String baseApiUrl = "http://192.168.10.13:7010/api/1.0.0";
  // static const String baseApiUrl = "https://sheba-plus-api.ems24.co/api/1.0.0";
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

  // notification
  static const String notificationApiUrl = "$securedApiUrl/user-notifications";
  static const String getNotificationApiUrl = "$notificationApiUrl/id";
  static const String markAsReadApiUrl = "$notificationApiUrl/mark-as-read/id";
  static const String markAllAsReadApiUrl = "$notificationApiUrl/all/mark-as-read";
  static const String getLatestNotificationApiUrl = "$notificationApiUrl/data-id";

  // customer
  static const String applyReferral = "$securedApiUrl/customers/apply-referral";
  static const String changePassword = "$securedApiUrl/customers/reset-password";

  // public controller
  static const String createDeviceToken = "$baseApiUrl/firebase/device/token/create";
  static const String removeDeviceToken = "$baseApiUrl/firebase/device/token/remove";

  //Agent Booking service
  static const String createAgentBooking = "$securedApiUrl/orders/create/agent-booking";
  static const String updateAgentBookingSchedule = "$securedApiUrl/orders/schedule/update/id";

  //Display Service
  static const String getAllDisplayServiceProductsApiUrl = "$baseApiUrl/products";

  // Category
  static const String getAllCategoryApiUrl = "$baseApiUrl/categories";
  static const String getAllSubCategoryApiUrl = "$baseApiUrl/sub-categories";
}
