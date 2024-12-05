import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/helpers/dialog_helper.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/auth/utils.auth.dart';
import 'package:sheba_plus/view/auth/widgets/count_down_timer.dart';
import 'package:sheba_plus/view/auth/widgets/custom_otp_fields.dart';
import 'package:sheba_plus/view/auth/widgets/otp_verify_screen_header.dart';
import 'package:sheba_plus/view/components/custom_appbar.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';
import 'package:sheba_plus/view/components/custom_password_field.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';
import 'package:sheba_plus/view/styles.dart';

class CommonVerificationScreen extends StatefulWidget {
  final String heading;
  final String description;
  final Widget headerImage;
  final String buttonLabel;
  final String bottomLeftLabel;
  final Function() bottomLeftLabelOnClick;
  final Function(String) onChanged;
  final VoidCallback onClick;
  final Function? resendEmailOtp;
  final String? phoneNumber;
  final bool? loading;
  final bool? forEmail;

  const CommonVerificationScreen({
    super.key,
    required this.heading,
    required this.description,
    required this.headerImage,
    required this.buttonLabel,
    required this.onClick,
    required this.bottomLeftLabel,
    required this.bottomLeftLabelOnClick,
    this.phoneNumber,
    this.loading = false,
    this.forEmail,
    this.resendEmailOtp,
    required this.onChanged,
  });

  @override
  State<CommonVerificationScreen> createState() =>
      _CommonVerificationScreenState();
}

class _CommonVerificationScreenState extends State<CommonVerificationScreen> {
  final authController = Get.find<AuthController>();
  final _formKey =
      GlobalKey<FormState>(); // Add a GlobalKey for form validation

  bool showSendAgain = false;

  void resendOTP() async {
    DialogHelper.showLoading();
    final status = await authController.resendOtp();
    DialogHelper.hideLoading();
    if (status) {
      Get.offAndToNamed(Routes.emailVerification);
      Utils.showSuccessToast(message: AuthScreenText.otpSentMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      resizeToAvoidBottomInset: true,
      body: widget.loading == true
          ? const Center(
              child: CustomLoader(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32),
                decoration: Styles.roundedWhite,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CommonVerificationHeader(
                        heading: widget.heading,
                        description: widget.description,
                        headerImage: widget.headerImage,
                      ),
                      32.kH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AuthScreenText.verificationCode,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: AppColors.hintText, fontSize: 14),
                          ),
                          Obx(
                            () => authController.registerResendCode.isTrue
                                ? TextButton(
                                    onPressed: () {
                                      authController.registerResendCode(
                                          !authController
                                              .registerResendCode.value);
                                      resendOTP();
                                    },
                                    child: Text(
                                      AuthScreenText.resendCode,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(fontSize: 14),
                                    ),
                                  )
                                : const SizedBox(),
                          )
                        ],
                      ),
                      CustomOtpFields(
                        formKey: _formKey,
                        onChanged: widget.onChanged,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: widget.bottomLeftLabelOnClick,
                            child: Text(
                              widget.bottomLeftLabel,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(fontSize: 14),
                            ),
                          ),
                          Obx(
                            () => authController.registerResendCode.isFalse
                                ? CountDownTimer(
                                    verificationPage: true,
                                    startTimeMilliseconds: AuthUtils.getVerificationTime(),
                                    onTimerFinish: () => authController
                                        .registerResendCode(!authController
                                            .registerResendCode.value),
                                  )
                                : const SizedBox(),
                          )
                        ],
                      ),
                      24.kH,
                      Obx(
                        () => CustomPrimaryButton(
                          loading: authController
                              .otpVerificationProcessLoading.value,
                          label: widget.buttonLabel,
                          onClick: () {
                            if (_formKey.currentState!.validate()) {
                              widget.onClick();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
