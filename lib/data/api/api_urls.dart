class ApiUrls{
  static const String baseApiUrl = "http://192.168.10.13:7010/api/1.0.0";
  static const String securedApiUrl = "$baseApiUrl/secured";
  static const String customerAuthApiUrl = "$baseApiUrl/auth/customer";

  //Authentication
  static const String loginApiUrl = "$customerAuthApiUrl/login";
  static const String registerApiUrl = "$customerAuthApiUrl/sign-up/by-email";

}