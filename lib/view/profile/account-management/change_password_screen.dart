import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/components/custom_password_field.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/profile/controller/profile_controller.dart';
import 'package:sheba_plus/view/styles.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _newPasswordFormKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();
  final profileController = Get.find<ProfileController>();

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
                    AuthScreenText.changePassword,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  4.kH,
                  Text(
                    AuthScreenText.changePasswordInfo,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppColors.paragraph,
                        ),
                  ),
                  24.kH,
                  Obx(
                    () => CustomPasswordField(
                      controller: profileController.oldPasswordController.value,
                      label: AuthScreenText.oldPassword,
                      obscure: profileController.oldPasswordObscure.value,
                      setObscure: profileController.onOldPasswordObscureTap,
                    ),
                  ),
                  Obx(
                    () => CustomPasswordField(
                      controller: profileController.newPasswordController.value,
                      label: AuthScreenText.newPassword,
                      obscure: profileController.newPasswordObscure.value,
                      setObscure: profileController.onNewPasswordObscureTap,
                    ),
                  ),
                  Obx(
                    () => CustomPasswordField(
                      controller:
                          profileController.confirmNewPasswordController.value,
                      label: AuthScreenText.confirmNewPassword,
                      obscure:
                          profileController.confirmNewPasswordObscure.value,
                      confirmPasswordField: true,
                      passwordController:
                          profileController.newPasswordController.value,
                      setObscure:
                          profileController.onConfirmNewPasswordObscureTap,
                    ),
                  ),
                  80.kH,
                  Obx(
                    () => CustomPrimaryButton(
                      loading: profileController
                          .changePasswordProcedureLoading.isTrue,
                      label: AuthScreenText.confirmPassword,
                      onClick: () {
                        if (_newPasswordFormKey.currentState!.validate() &&
                            profileController
                                .changePasswordProcedureLoading.isFalse) {
                          changePassword();
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

  void changePassword() async {
    final response = await profileController.changePassword();
    if (response) {
      Get.back();
      profileController.resetChangePasswordFields();
      Utils.showSuccessToast(
          message: AuthScreenText.passwordChangeSuccessfully);
    }
  }
}
