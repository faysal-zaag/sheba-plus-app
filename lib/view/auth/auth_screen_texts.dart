import 'package:get/get.dart';

class AuthScreenText {
  // Sign in Texts
  static String get signInScreenMessage => "signInScreenMessage".tr;
  static String get signIn => "signIn".tr;
  static String get signInNotice => "signInNotice".tr;
  static String get keepMeLoggedIn => "keepMeLoggedIn".tr;
  static String get forgotPassword => "forgotPassword".tr;
  static String get emailId => "emailId".tr;
  static String get emailIdHintText => "emailIdHintText".tr;
  static String get password => "password".tr;
  static String get passwordHintText => "passwordHintText".tr;
  static String get or => "or".tr;
  static String get noAccount => "noAccount".tr;

  // Sign up Texts
  static String get registerAccount => "registerAccount".tr;
  static String get registerNotice => "registerNotice".tr;
  static String get signUp => "signUp".tr;
  static String get firstName => "firstName".tr;
  static String get firstNameHintText => "firstNameHintText".tr;
  static String get lastName => "lastName".tr;
  static String get lastNameHintText => "lastNameHintText".tr;
  static String get confirmPassword => "confirmPassword".tr;
  static String get confirmNewPassword => "confirmNewPassword".tr;
  static String get firstNameValidatorText => "firstNameValidatorText".tr;
  static String get lastNameValidatorText => "lastNameValidatorText".tr;
  static String get confirmPasswordValidatorText => "confirmPasswordValidatorText".tr;
  static String get alreadyHaveAnAccount => "alreadyHaveAnAccount".tr;

  // Referring screen texts
  static String get referringHeader => "referringHeader".tr;
  static String get referringDescription => "referringDescription".tr;
  static String get existingUserName => "existingUserName".tr;
  static String get nameRequired => "nameRequired".tr;
  static String get existingUserNameHintText => "existingUserNameHintText".tr;
  static String get phoneNumber => "phoneNumber".tr;
  static String get existingUserPhoneNumber => "existingUserPhoneNumber".tr;
  static String get existingUserPhoneNumberHintText => "existingUserPhoneNumberHintText".tr;

  // email verification
  static String get resendCode => "resendCode".tr;
  static String get verificationCode => "verificationCode".tr;
  static String get verify => "verify".tr;
  static String get emailVerificationHeader => "emailVerificationHeader".tr;
  static String get emailVerifiedSuccessfully => "emailVerifiedSuccessfully".tr;
  static String get passwordChangeSuccessfully => "passwordChangeSuccessfully".tr;
  static String get weHaveJustSent => "weHaveJustSent".tr;
  static String get createAccount => "createAccount".tr;
  static String get changeEmailAddress => "changeEmailAddress".tr;
  static String get changePassword => "changePassword".tr;
  static String get oldPassword => "oldPassword".tr;
  static String get newPassword => "newPassword".tr;
  static String get newPasswordHintText => "newPasswordHintText".tr;
  static String get resetPassword => "resetPassword".tr;
  static String get resetPasswordInfo => "resetPasswordInfo".tr;
  static String get changePasswordInfo => "changePasswordInfo".tr;
  static String get sendVerificationCode => "sendVerificationCode".tr;
  static String get otpSentMessage => "otpSentMessage".tr;
  static String get forgetPasswordHeadline => "forgetPasswordHeadline".tr;
  static String get loggedInSuccessMessage => "loggedInSuccessMessage".tr;
  static String get loggedOut => "loggedOut".tr;

  // register address screen
  static String get registerAddressHeader => "registerAddressHeader".tr;
  static String get mobileNumber => "mobileNumber".tr;
  static String get mobileNumberValidatorText => "mobileNumberValidatorText".tr;
  static String get streetAddress => "streetAddress".tr;
  static String get streetAddressValidatorText => "streetAddressValidatorText".tr;
  static String get cityTown => "cityTown".tr;
  static String get cityTownValidatorText => "cityTownValidatorText".tr;
  static String get country => "country".tr;
  static String get countryValidatorText => "countryValidatorText".tr;
  static String get postalOrZip => "postalOrZip".tr;
  static String get postalOrZipValidatorText => "postalOrZipValidatorText".tr;
  static String get state => "state".tr;
  static String get stateValidatorText => "stateValidatorText".tr;
  static String get additionalInfo => "additionalInfo".tr;
  static String get homeAddressSaved => "homeAddressSaved".tr;

  // Dynamic message
  static String numberShouldContains(int length) => "numberShouldContains".trParams({'length': length.toString()});
}
