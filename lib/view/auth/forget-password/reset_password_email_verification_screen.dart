import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/helpers/dialog_helper.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/auth/utils.auth.dart';
import 'package:sheba_plus/view/auth/widgets/common_verification_screen.dart';

class ResetPasswordEmailVerificationScreen extends StatefulWidget {
  const ResetPasswordEmailVerificationScreen({super.key});

  @override
  State<ResetPasswordEmailVerificationScreen> createState() => _ResetPasswordEmailVerificationScreenState();
}

class _ResetPasswordEmailVerificationScreenState extends State<ResetPasswordEmailVerificationScreen> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonVerificationScreen(
        heading: AuthScreenText.emailVerificationHeader,
        description: "${AuthScreenText.weHaveJustSent} ${AuthUtils.getSecuredEmail(email: authController.forgetPasswordEmailController.value.text)}",
        headerImage: Image.asset(
          AppImages.otpVerification,
          width: 250,
        ),
        buttonLabel: AuthScreenText.verifyEmail,
        onClick: () async {
          final response = await authController.verifyResetPasswordEmail();
          if (response) {
            Utils.showSuccessToast(
              message: AuthScreenText.emailVerifiedSuccessfully,
            );
            Get.offAndToNamed(Routes.setNewPassword);
          }
        },
        bottomLeftLabel: AuthScreenText.changeEmailAddress,
        bottomLeftLabelOnClick: () {
          authController.resetPasswordByEmailOtpCode("");
          Get.offAndToNamed(Routes.forgetPassword);
        },
        resendEmailOtp: forgetPassword,
        onChanged: (value) => authController.resetPasswordByEmailOtpCode(value),
        visibleResendCode: authController.forgetPasswordResendCode.value,
        onTimerFinish: () => authController.forgetPasswordResendCode(true),
      ),
    );
  }

  void forgetPassword() async {
    DialogHelper.showLoading();
    final response = await authController.forgetPassword();
    DialogHelper.hideLoading();
    if (response) {
      authController.forgetPasswordResendCode(false);
      Utils.showSuccessToast(message: AuthScreenText.otpSentMessage);
    }
  }
}
