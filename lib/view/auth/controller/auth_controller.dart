import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sheba_plus/data/services/storage_service.dart';
import 'package:sheba_plus/models/login/login_request.model.dart';
import 'package:sheba_plus/models/referral/referral.dart';
import 'package:sheba_plus/models/register/register_request.model.dart';
import 'package:sheba_plus/models/user/user.dart' as userModel;
import 'package:sheba_plus/models/verification/verification_model.dart';
import 'package:sheba_plus/utils/logger.dart';
import 'package:sheba_plus/view/profile/controller/profile_controller.dart';
import 'package:sheba_plus/view/profile/saved-address/controller/address_controller.dart';
import 'package:sheba_plus/view_model/repositories/auth.repositories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;
  final AddressController _addressController;
  final ProfileController _profileController;
  final StorageService _storageService;

  AuthController(this._authRepository, this._storageService,
      this._profileController, this._addressController);

  final isLoggedIn = false.obs;
  final signInProcedureLoading = false.obs;
  final registerProcedureLoading = false.obs;
  final otpVerificationProcessLoading = false.obs;
  final otpVerificationForResetPasswordProcessLoading = false.obs;
  final forgetPasswordProcedureLoading = false.obs;
  final setNewPasswordProcedureLoading = false.obs;
  final referralApplyingLoading = false.obs;

  final signInEmailController = TextEditingController().obs;
  final signInPasswordController = TextEditingController().obs;

  final registerFirstNameController = TextEditingController().obs;
  final registerLastNameController = TextEditingController().obs;
  final registerEmailController = TextEditingController().obs;
  final registerPasswordController = TextEditingController().obs;
  final registerConfirmPasswordController = TextEditingController().obs;

  final forgetPasswordEmailController = TextEditingController().obs;
  final newPasswordController = TextEditingController().obs;
  final confirmNewPasswordController = TextEditingController().obs;

  final registerResendCode = false.obs;
  final registerOtpCode = "".obs;
  final resetPasswordByEmailOtpCode = "".obs;

  final signInPasswordObscure = true.obs;
  final registerPasswordObscure = true.obs;
  final registerConfirmPasswordObscure = true.obs;
  final newPasswordObscure = true.obs;
  final confirmNewPasswordObscure = true.obs;
  final keepLoggedIn = false.obs;

  final referralNameController = TextEditingController().obs;
  final referralPhoneNumber = "".obs;
  final referralPhoneNumberLength = 10.obs;
  final referralCountryCode = "".obs;

  void onSignInObscureTap() {
    signInPasswordObscure(!signInPasswordObscure.value);
  }

  void onRegisterObscureTap() {
    registerPasswordObscure(!registerPasswordObscure.value);
  }

  void onNewPasswordObscureTap() {
    newPasswordObscure(!newPasswordObscure.value);
  }

  void onConfirmNewPasswordObscureTap() {
    confirmNewPasswordObscure(!confirmNewPasswordObscure.value);
  }

  void onRegisterConfirmObscureTap() {
    registerConfirmPasswordObscure(!registerConfirmPasswordObscure.value);
  }

  void onKeepLoggedInTap() {
    keepLoggedIn(!keepLoggedIn.value);
  }

  void cleanRegistrationData() {
    registerFirstNameController.value.clear();
    registerLastNameController.value.clear();
    registerEmailController.value.clear();
    registerPasswordController.value.clear();
    registerConfirmPasswordController.value.clear();
    registerOtpCode("");
  }

  void cleanResetPasswordData() {
    forgetPasswordEmailController.value.clear();
    newPasswordController.value.clear();
    resetPasswordByEmailOtpCode("");
  }

  void cleanSignInData() {
    signInEmailController.value.clear();
    signInPasswordController.value.clear();
  }

  void resetReferralFields() {
    referralNameController.value.clear();
    referralPhoneNumber.value = "";
    referralCountryCode.value = "";
  }

  Future<bool> isAuthenticated({String? accessToken}) async {
    try {
      if (accessToken != null) {
        _storageService.saveAuthToken(accessToken);
        final profileResponse =
            await _authRepository.getProfile(accessToken: accessToken);
        await _addressController.getAllAddress();
        _profileController.user(userModel.User.fromJson(profileResponse.data["info"]));
        _profileController.userFirstNameController.value.text =
            _profileController.user.value.firstName;
        _profileController.userLastNameController.value.text =
            _profileController.user.value.lastName;
        _profileController.userEmailController.value.text =
            _profileController.user.value.email;
        _profileController.userPhoneNumberController.value.text =
            "${_profileController.user.value.countryCode}${_profileController.user.value.mobileNumber}";
        isLoggedIn(true);
        return true;
      }
      return false;
    } catch (e) {
      Log.error(e.toString());
      _storageService.removeAuthToken();
      return false;
    }
  }

  Future<bool> login() async {
    try {
      signInProcedureLoading(true);
      final response = await _authRepository.login(
        loginRequest: LoginRequest(
          email: signInEmailController.value.text,
          password: signInPasswordController.value.text,
        ),
      );
      String accessToken = response.data["token"]["access"];

      await isAuthenticated(accessToken: accessToken);

      if (keepLoggedIn.isTrue) {
        _storageService.saveAuthToken(response.data["token"]["access"]);
      }
      await createDeviceToken();

      return true;
    } catch (e) {
      Log.error(e.toString());
      return false;
    } finally {
      signInProcedureLoading(false);
    }
  }

  Future<bool> register() async {
    try {
      registerProcedureLoading(true);
      await _authRepository.register(
        registerRequest: RegisterRequest(
          firstName: registerFirstNameController.value.text,
          lastName: registerLastNameController.value.text,
          email: registerEmailController.value.text,
          password: registerPasswordController.value.text,
        ),
      );

      return true;
    } catch (e) {
      Log.error(e.toString());
      return false;
    } finally {
      registerProcedureLoading(false);
    }
  }

  Future<bool> applyReferral() async {
    try {
      referralApplyingLoading(true);
      Referral referralData= Referral(
        fullName: referralNameController.value.text,
        countryCode: referralCountryCode.value,
        mobileNumber: referralPhoneNumber.value,
      );

      await _authRepository.applyReferral(
        referral: referralData,
      );
      return true;
    } catch (e) {
      Log.error(e.toString());
      return false;
    } finally {
      referralApplyingLoading(false);
    }
  }

  Future<bool> resendOtp() async {
    try {
      await _authRepository.register(
        registerRequest: RegisterRequest(
          firstName: registerFirstNameController.value.text,
          lastName: registerLastNameController.value.text,
          email: registerEmailController.value.text,
          password: registerPasswordController.value.text,
        ),
      );
      return true;
    } catch (e) {
      Log.error(e.toString());
      return false;
    } finally {}
  }

  Future<bool> verifyEmail({String? email}) async {
    try {
      otpVerificationProcessLoading(true);
      final response = await _authRepository.verifyEmail(
        verificationModel: VerificationModel(
          code: int.parse(registerOtpCode.value),
          email: email ?? registerEmailController.value.text,
        ),
      );
      String accessToken = response.data["token"]["access"];
      _storageService.saveAuthToken(accessToken);

      return true;
    } catch (e) {
      Log.error(e.toString());
      return false;
    } finally {
      otpVerificationProcessLoading(false);
    }
  }

  Future<bool> setNewPassword() async {
    try {
      setNewPasswordProcedureLoading(true);
      await _authRepository.setNewPassword(
          verificationModel: VerificationModel(
            code: int.parse(resetPasswordByEmailOtpCode.value),
            email: forgetPasswordEmailController.value.text,
          ),
          newPassword: newPasswordController.value.text);
      return true;
    } catch (e) {
      Log.error(e.toString());
      return false;
    } finally {
      setNewPasswordProcedureLoading(false);
    }
  }

  Future<bool> createDeviceToken() async {
    try {
      await _authRepository.createDeviceToken(userId: _profileController.user.value.id, fcmToken: _storageService.getFCMToken() ?? "");
      return true;
    } catch (e) {
      Log.error(e.toString());
      return false;
    }
  }

  Future<bool> verifyResetPasswordEmail({String? email}) async {
    try {
      otpVerificationProcessLoading(true);
      await _authRepository.verifyResetPasswordEmail(
        verificationModel: VerificationModel(
          code: int.parse(resetPasswordByEmailOtpCode.value),
          email: email ?? forgetPasswordEmailController.value.text,
        ),
      );
      return true;
    } catch (e) {
      Log.error(e.toString());
      return false;
    } finally {
      otpVerificationProcessLoading(false);
    }
  }

  Future<bool> forgetPassword({String? email}) async {
    try {
      forgetPasswordProcedureLoading(true);
      await _authRepository.resetPasswordByEmail(
        email: email ?? forgetPasswordEmailController.value.text,
      );
      return true;
    } catch (e) {
      Log.error(e.toString());
      return false;
    } finally {
      forgetPasswordProcedureLoading(false);
    }
  }

  Future<bool> facebookLogin() async {
    final result = await FacebookAuth.instance
        .login(permissions: ['public_profile', 'email']);

    if (result.status == LoginStatus.success) {
      String? accessToken = result.accessToken!.token;

      final AuthCredential credential =
      FacebookAuthProvider.credential(accessToken);
      UserCredential firebaseResult =
      await FirebaseAuth.instance.signInWithCredential(credential);

      String? idToken = await firebaseResult.user?.getIdToken();

      final response =
      await _authRepository.socialLogin(firebaseToken: idToken ?? '');

      _storageService.saveAuthToken(response.data["token"]["access"]);

      _profileController.user(userModel.User.fromJson(response.data["user"]));
      await _addressController.getAllAddress();
      await createDeviceToken();
      isLoggedIn(true);
    }
    return true;
  }

  Future<bool> googleLogin() async {
    try{
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );

      GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential firebaseResult =
        await FirebaseAuth.instance.signInWithCredential(credential);

        String? idToken = await firebaseResult.user?.getIdToken();

        final response =
        await _authRepository.socialLogin(firebaseToken: idToken ?? "");

        _storageService.saveAuthToken(response.data["token"]["access"]);

        _profileController.user(userModel.User.fromJson(response.data["user"]));
        await _addressController.getAllAddress();
        await createDeviceToken();
        isLoggedIn(true);
      }
      return true;
    }
    catch(e){
      Log.error(e.toString());
      return false;
    }
  }

  Future<bool> appleLogin() async {
    return true;
  }

  void logout() async {
    isLoggedIn(false);
    await FirebaseAuth.instance.signOut();
    await FacebookAuth.instance.logOut();
    await GoogleSignIn().signOut();
    _authRepository.removeDeviceToken(fcmToken: _storageService.getFCMToken() ?? "");
    _profileController.user(const userModel.User());
    _storageService.removeAuthToken();
  }
}
