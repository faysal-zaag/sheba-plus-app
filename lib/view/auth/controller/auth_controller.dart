import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final isLoggedIn = false.obs;
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
    return true;
  }

  Future<bool> register() async {
    return true;
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
