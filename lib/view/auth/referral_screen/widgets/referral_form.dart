import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/utils/validators/input_validators.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
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
            controller: authController.registerFirstNameController.value,
            label: AuthScreenText.existingUserName,
            hintText: AuthScreenText.existingUserNameHintText,
            validator: (value) => InputValidators.generalValidator(
                value: value, message: AuthScreenText.nameRequired),
          ),
          TextFieldWithLabel(
            controller: authController.registerLastNameController.value,
            label: AuthScreenText.existingUserPhoneNumber,
            hintText: AuthScreenText.existingUserPhoneNumberHintText,
          ),
          12.kH,
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
                child: CustomPrimaryButton(
                  label: GlobalTexts.continueText,
                  onClick: continueReferring,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void skipReferring() async {
    Get.offAndToNamed(Routes.signIn);
  }

  void continueReferring() async {
    if (_referralFormKey.currentState!.validate()) {

    }
  }
}
