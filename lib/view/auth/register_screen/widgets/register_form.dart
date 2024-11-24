import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/validators/input_validators.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/components/custom_password_field.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _registerFormKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerFormKey,
      child: Column(
        children: [
          TextFieldWithLabel(
            controller: authController.registerFirstNameController.value,
            label: AuthScreenText.firstName,
            hintText: AuthScreenText.emailIdHintText,
            validator: (value) => InputValidators.generalValidator(
                value: value, message: AuthScreenText.firstNameValidatorText),
          ),
          TextFieldWithLabel(
            controller: authController.registerLastNameController.value,
            label: AuthScreenText.lastName,
            hintText: AuthScreenText.emailIdHintText,
            validator: (value) => InputValidators.generalValidator(
                value: value, message: AuthScreenText.lastNameValidatorText),
          ),
          TextFieldWithLabel(
            controller: authController.registerEmailController.value,
            label: AuthScreenText.emailId,
            hintText: AuthScreenText.emailIdHintText,
            validator: (value) => InputValidators.generalValidator(
                value: value, message: AuthScreenText.emailIdValidatorText),
          ),
          Obx(
            () => CustomPasswordField(
              label: AuthScreenText.password,
              controller: authController.registerPasswordController.value,
              obscure: authController.registerPasswordObscure.value,
              setObscure: authController.onRegisterObscureTap,
            ),
          ),
          Obx(
            () => CustomPasswordField(
              label: AuthScreenText.confirmPassword,
              controller: authController.registerConfirmPasswordController.value,
              obscure: authController.registerConfirmPasswordObscure.value,
              setObscure: authController.onRegisterConfirmObscureTap,
              confirmPasswordField: true,
            ),
          ),
          12.kH,
          CustomPrimaryButton(
            label: AuthScreenText.signUp,
            onClick: register,
          )
        ],
      ),
    );
  }

  void register() async {
    if (_registerFormKey.currentState!.validate()) {
      authController.register();
    }
  }
}
