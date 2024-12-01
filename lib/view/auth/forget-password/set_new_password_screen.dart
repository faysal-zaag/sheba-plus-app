import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/utils/validators/input_validators.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/auth/widgets/otp_verify_screen_header.dart';
import 'package:sheba_plus/view/components/custom_appbar.dart';
import 'package:sheba_plus/view/components/custom_password_field.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';
import 'package:sheba_plus/view/styles.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  final _newPasswordFormKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _newPasswordFormKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            decoration: Styles.roundedWhite,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AuthScreenText.resetPassword,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  4.kH,
                  Text(
                    AuthScreenText.resetPasswordInfo,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.paragraph,
                        ),
                  ),
                  24.kH,
                  Obx(
                    () => CustomPasswordField(
                      controller: authController.newPasswordController.value,
                      label: AuthScreenText.newPassword,
                      obscure: authController.newPasswordObscure.value,
                      setObscure: authController.onNewPasswordObscureTap,
                    ),
                  ),
                  Obx(
                    () => CustomPasswordField(
                      controller:
                          authController.confirmNewPasswordController.value,
                      label: AuthScreenText.confirmNewPassword,
                      obscure: authController.confirmNewPasswordObscure.value,
                      confirmPasswordField: true,
                      passwordController:
                          authController.newPasswordController.value,
                      setObscure: authController.onConfirmNewPasswordObscureTap,
                    ),
                  ),
                  80.kH,
                  Obx(
                    () => CustomPrimaryButton(
                      loading:
                          authController.setNewPasswordProcedureLoading.isTrue,
                      label: AuthScreenText.confirmPassword,
                      onClick: () {
                        if (_newPasswordFormKey.currentState!.validate() &&
                            authController
                                .forgetPasswordProcedureLoading.isFalse) {
                          setNewPassword();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void setNewPassword() async {
    final response = await authController.setNewPassword();
    if (response) {
      Get.offAndToNamed(Routes.signIn);
      authController.cleanResetPasswordData();
      Utils.showSuccessToast(message: AuthScreenText.passwordChangeSuccessfully);
    }
  }
}
