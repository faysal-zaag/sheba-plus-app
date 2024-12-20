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

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonVerificationScreen(
        heading: AuthScreenText.emailVerificationHeader,
        description: "${AuthScreenText.weHaveJustSent} ${AuthUtils.getSecuredEmail(email: authController.registerEmailController.value.text)}",
        headerImage: Image.asset(
          AppImages.otpVerification,
          width: 250,
        ),
        buttonLabel: AuthScreenText.createAccount,
        onClick: () async {
          final response = await authController.verifyEmail(email: authController.registerEmailController.value.text);
          if (response) {
            authController.cleanRegistrationData();
            Get.offAndToNamed(Routes.registerAddress);
            Utils.showSuccessToast(
              message: AuthScreenText.emailVerifiedSuccessfully,
            );
          }
        },
        bottomLeftLabel: AuthScreenText.changeEmailAddress,
        bottomLeftLabelOnClick: () {
          authController.registerOtpCode("");
          Get.offAndToNamed(Routes.register);
        },
        resendEmailOtp: () async {
          DialogHelper.showLoading();
          final status = await authController.resendOtp();
          DialogHelper.hideLoading();
          if (status) {
            authController.registerResendCode(false);
            Utils.showSuccessToast(message: AuthScreenText.otpSentMessage);
          }
        },
        onChanged: (value) => authController.registerOtpCode(value),
        visibleResendCode: authController.registerResendCode.isTrue,
        onTimerFinish: () => authController.registerResendCode(!authController.registerResendCode.value),
      ),
    );
  }
}
