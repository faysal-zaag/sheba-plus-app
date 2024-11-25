import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/login/login_request.model.dart';
import 'package:sheba_plus/models/register/register_request.model.dart';
import 'package:sheba_plus/utils/enums.dart';
import 'package:sheba_plus/utils/enums.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/view_model/repositories/auth.repositories.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository;

  AuthController(this._authRepository);

  final isLoggedIn = false.obs;
  final loginProcedureLoading = false.obs;
  final registerProcedureLoading = false.obs;

  final signInEmailController = TextEditingController().obs;
  final signInPasswordController = TextEditingController().obs;

  final registerFirstNameController = TextEditingController().obs;
  final registerLastNameController = TextEditingController().obs;
  final registerEmailController = TextEditingController().obs;
  final registerPasswordController = TextEditingController().obs;
  final registerConfirmPasswordController = TextEditingController().obs;

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

  Future<bool> login() async {
    try{
      loginProcedureLoading(true);
      await _authRepository.login(
        loginRequest: LoginRequest(
          email: signInEmailController.value.text,
          password: signInPasswordController.value.text,
        ),
      );
      return true;
    }
    catch(e){
      return false;
    }
    finally{
      loginProcedureLoading(false);
    }
  }

  Future<bool> register() async {
    try{
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
    }
    catch(e){
      return false;
    }
    finally{
      registerProcedureLoading(false);
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
