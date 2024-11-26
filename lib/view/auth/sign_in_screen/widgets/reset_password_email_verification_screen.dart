import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/auth/utils.auth.dart';
import 'package:sheba_plus/view/auth/widgets/common_verification_screen.dart';

class ResetPasswordEmailVerificationScreen extends StatefulWidget {
  const ResetPasswordEmailVerificationScreen({super.key});

  @override
  State<ResetPasswordEmailVerificationScreen> createState() =>
      _ResetPasswordEmailVerificationScreenState();
}

class _ResetPasswordEmailVerificationScreenState extends State<ResetPasswordEmailVerificationScreen> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return CommonVerificationScreen(
      heading: AuthScreenText.emailVerificationHeader,
      description:
      "${AuthScreenText.weHaveJustSent} ${AuthUtils.getSecuredEmail(email: authController.registerEmailController.value.text)}",
      headerImage: Image.asset(
        AppImages.otpVerification,
        width: 250,
      ),
      buttonLabel: AuthScreenText.createAccount,
      onClick: () async {
        final response = await authController.verifyEmail();
        if(response){
          Utils.showSuccessToast(message: "Email verified successfully",);
          authController.cleanRegistrationData();
          Get.offAndToNamed(Routes.signIn);
        }
      },
      bottomLeftLabel: AuthScreenText.changeEmailAddress,
      bottomLeftLabelOnClick: () {
        authController.registerOtpCode("");
        Get.offAndToNamed(Routes.register);
      },
      onChanged: (value) => authController.resetPasswordByEmailOtpCode(value),
      afterCodeSent: () {},
      onError: () {},
    );
  }
}
