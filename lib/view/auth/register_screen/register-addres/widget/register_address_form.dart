import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/validators/input_validators.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/components/custom_dropdown.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';
import 'package:sheba_plus/view/global_texts.dart';
import 'package:sheba_plus/view/styles.dart';

class RegisterAddressForm extends StatefulWidget {
  const RegisterAddressForm({super.key});

  @override
  State<RegisterAddressForm> createState() => _RegisterAddressFormState();
}

class _RegisterAddressFormState extends State<RegisterAddressForm> {
  final formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
              textEditingController:
                  authController.registerAddressStreetController.value,
              hintText: "${AuthScreenText.streetAddress}*", validator: (value) => InputValidators.generalValidator(
              value: value, message: AuthScreenText.streetAddressValidatorText)),
          16.kH,
          CustomTextField(
              textEditingController:
                  authController.registerAddressStreetController.value,
              hintText: "${AuthScreenText.streetAddress} 2", validator: (value) => InputValidators.generalValidator(
              value: value, message: AuthScreenText.postalOrZipValidatorText)),
          16.kH,
          CustomTextField(
              textEditingController:
                  authController.registerAddressStreetController.value,
              hintText: "${AuthScreenText.cityTown}*", validator: (value) => InputValidators.generalValidator(
              value: value, message: AuthScreenText.cityTownValidatorText)),
          16.kH,
          CustomDropdown(
            items: const ["A", "B", "C"],
            onChanged: (value) {},
            selectedValue: null,
            borderColor: AppColors.border,
            hintText: "${AuthScreenText.state}*",
            validator: (value){
              if(authController.registerAddressSelectedCountry.isEmpty){
                return AuthScreenText.stateValidatorText;
              }
              return null;
            },
          ),
          16.kH,
          CustomTextField(
              textEditingController:
                  authController.registerAddressStreetController.value,
              hintText: "${AuthScreenText.postalOrZip}*",
            validator: (value) => InputValidators.generalValidator(
                value: value, message: AuthScreenText.postalOrZipValidatorText),),
          16.kH,
          CustomDropdown(
            items: const ["A", "B", "C"],
            onChanged: (value) {},
            selectedValue: null,
            borderColor: AppColors.border,
            hintText: "${AuthScreenText.country}*",
            validator: (value){
              if(authController.registerAddressSelectedCountry.isEmpty){
                return AuthScreenText.countryValidatorText;
              }
              return null;
            },
          ),
          16.kH,
          TextField(
            maxLines: 10, // Allows multiple lines
            minLines: 5, // Minimum height
            decoration: Styles.getTextFieldInputDecoration(context: context, fillColor: AppColors.white, hintText: AuthScreenText.additionalInfo),),
          24.kH,
          CustomPrimaryButton(label: GlobalTexts.next, onClick: (){
            if(formKey.currentState!.validate()){

            }
          })
        ],
      ),
    );
  }
}
