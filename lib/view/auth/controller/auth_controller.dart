import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/data/services/storage_service.dart';
import 'package:sheba_plus/models/login/login_request.model.dart';
import 'package:sheba_plus/models/register/register_request.model.dart';
import 'package:sheba_plus/models/user/user.dart';
import 'package:sheba_plus/models/verification/verification_model.dart';
import 'package:sheba_plus/utils/enums.dart';
import 'package:sheba_plus/utils/enums.dart';
import 'package:sheba_plus/utils/logger.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/view/profile/controller/profile_controller.dart';
import 'package:sheba_plus/view_model/repositories/auth.repositories.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;
  final ProfileController _profileController;
  final StorageService _storageService;

  AuthController(this._authRepository, this._storageService, this._profileController);

  final isLoggedIn = false.obs;
  final signInProcedureLoading = false.obs;
  final registerProcedureLoading = false.obs;
  final otpVerificationProcessLoading = false.obs;
  final otpVerificationForResetPasswordProcessLoading = false.obs;
  final forgetPasswordProcedureLoading = false.obs;

  final signInEmailController = TextEditingController().obs;
  final signInPasswordController = TextEditingController().obs;

  final registerFirstNameController = TextEditingController().obs;
  final registerLastNameController = TextEditingController().obs;
  final registerEmailController = TextEditingController().obs;
  final registerPasswordController = TextEditingController().obs;
  final registerConfirmPasswordController = TextEditingController().obs;

  final forgetPasswordEmailController = TextEditingController().obs;
  final newPasswordController = TextEditingController().obs;

  final registerResendCode = false.obs;
  final registerOtpCode = "".obs;
  final resetPasswordByEmailOtpCode = "".obs;

  final signInPasswordObscure = true.obs;
  final registerPasswordObscure = true.obs;
  final registerConfirmPasswordObscure = true.obs;
  final keepLoggedIn = false.obs;

  void onSignInObscureTap() {
    signInPasswordObscure(!signInPasswordObscure.value);
  }

  void onRegisterObscureTap() {
    registerPasswordObscure(!registerPasswordObscure.value);
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
    resetPasswordByEmailOtpCode("");
  }

  void cleanSignInData() {
    signInEmailController.value.clear();
    signInPasswordController.value.clear();
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

      final profileResponse = await _authRepository.getProfile(accessToken: accessToken);
      _profileController.user(User.fromJson(profileResponse.data["info"]));
      _profileController.userFirstNameController.value.text = _profileController.user.value.firstName;
      _profileController.userLastNameController.value.text = _profileController.user.value.lastName;
      _profileController.userEmailController.value.text = _profileController.user.value.email;
      isLoggedIn(true);

      if(keepLoggedIn.isTrue){
        _storageService.saveAuthToken(response.data["token"]["access"]);
      }
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
      return false;
    } finally {
      registerProcedureLoading(false);
    }
  }

  // Future<bool> getUserProfile() async{
  //   try{
  //     if(_storageService.getAuthToken() == null){
  //       return false;
  //     }
  //     else{
  //       final profileResponse = await _authRepository.getProfile();
  //       _profileController.user(User.fromJson(profileResponse.data["info"]));
  //       return true;
  //     }
  //   }
  //   catch(e){
  //     Log.error(e.toString());
  //     return false;
  //   }
  // }

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
      return false;
    } finally {}
  }

  Future<bool> verifyEmail() async {
    try {
      otpVerificationProcessLoading(true);
      await _authRepository.verifyEmail(
        verificationModel: VerificationModel(
          code: int.parse(registerOtpCode.value),
          email: registerEmailController.value.text,
        ),
      );
      return true;
    } catch (e) {
      return false;
    } finally {
      otpVerificationProcessLoading(false);
    }
  }

  Future<bool> verifyResetPasswordEmail() async {
    try {
      otpVerificationProcessLoading(true);
      await _authRepository.verifyResetPasswordEmail(
        verificationModel: VerificationModel(
          code: int.parse(resetPasswordByEmailOtpCode.value),
          email: forgetPasswordEmailController.value.text,
        ),
        newPassword: newPasswordController.value.text
      );
      return true;
    } catch (e) {
      return false;
    } finally {
      otpVerificationProcessLoading(false);
    }
  }

  Future<bool> forgetPassword() async {
    try {
      forgetPasswordProcedureLoading(true);
      await _authRepository.resetPasswordByEmail(
        email: forgetPasswordEmailController.value.text,
      );
      return true;
    } catch (e) {
      return false;
    } finally {
      forgetPasswordProcedureLoading(false);
    }
  }

  Future<bool> facebookLogin() async {
    return true;
  }

  Future<bool> googleLogin() async {
    return true;
  }

  Future<bool> appleLogin() async {
    return true;
  }
}
