import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/utils/validators/input_validators.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/auth/widgets/otp_verify_screen_header.dart';
import 'package:sheba_plus/view/components/custom_appbar.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';
import 'package:sheba_plus/view/styles.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _resetPasswordFormKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _resetPasswordFormKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            decoration: Styles.roundedWhite,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      CommonVerificationHeader(
                        heading: AuthScreenText.forgetPasswordHeadline,
                        description: "",
                        headerImage: Image.asset(
                          AppImages.forgetPassword,
                          width: 250,
                        ),
                      ),
                    ],
                  ),
                  TextFieldWithLabel(
                    controller: authController.forgetPasswordEmailController.value,
                    label: AuthScreenText.emailId,
                    hintText: AuthScreenText.emailIdHintText,
                    validator: (value) => InputValidators.emailValidator(value),
                  ),
                  80.kH,
                  Obx(
                    () => CustomPrimaryButton(
                      loading: authController.forgetPasswordProcedureLoading.isTrue,
                      label: AuthScreenText.sendVerificationCode,
                      onClick: () {
                        if (_resetPasswordFormKey.currentState!.validate() &&
                            authController
                                .forgetPasswordProcedureLoading.isFalse) {
                          forgetPassword();
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

  void forgetPassword() async {
    final response = await authController.forgetPassword();
    if (response) {
      Get.offAndToNamed(Routes.emailVerificationForResetPassword);
      Utils.showSuccessToast(message: AuthScreenText.otpSentMessage);
    }
  }
}
