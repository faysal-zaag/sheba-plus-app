import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/utils/validators/input_validators.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/components/custom_phone_number_field.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';
import 'package:sheba_plus/view/global_texts.dart';

class ReferralForm extends StatefulWidget {
  const ReferralForm({super.key});

  @override
  State<ReferralForm> createState() => _ReferralFormState();
}

class _ReferralFormState extends State<ReferralForm> {
  final _referralFormKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _referralFormKey,
      child: Column(
        children: [
          TextFieldWithLabel(
            controller: authController.referralNameController.value,
            label: AuthScreenText.existingUserName,
            hintText: AuthScreenText.existingUserNameHintText,
            validator: (value) => InputValidators.generalValidator(
                value: value, message: AuthScreenText.nameRequired),
          ),
          Obx(() {
            int validationNumberLength =
                authController.referralPhoneNumberLength.value;

            return CustomPhoneField(
              onChange: (mobileNumber) {
                  authController.referralPhoneNumber.value = mobileNumber!;
                  return null;
              },
              onCountryChanged: (dialCode){
                authController.referralCountryCode.value = dialCode;
              },
              label: AuthScreenText.existingUserPhoneNumber,
              validatorNumberLength: validationNumberLength,
            );
          }),
          24.kH,
          Row(
            children: [
              Expanded(
                child: CustomPrimaryButton(
                  color: AppColors.white,
                  borderColor: AppColors.border,
                  labelColor: AppColors.black,
                  label: GlobalTexts.skip,
                  onClick: skipReferring,
                ),
              ),
              16.kW,
              Expanded(
                child: Obx(
                  () => CustomPrimaryButton(
                    loading: authController.referralApplyingLoading.isTrue,
                    label: GlobalTexts.continueText,
                    onClick: continueReferring,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void skipReferring() async {
    Get.back();
  }

  void continueReferring() async {
    if (_referralFormKey.currentState!.validate()) {
      final response = await authController.applyReferral();
      if (response) {
        authController.resetReferralFields();
        if (authController.isLoggedIn.isTrue) {
          Get.offAndToNamed(Routes.home);
        } else {
          Get.offAndToNamed(Routes.signIn);
        }
      }
    }
  }
}
