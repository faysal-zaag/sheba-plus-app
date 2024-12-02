import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sheba_plus/models/address/address.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/utils/validators/input_validators.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/components/custom_dropdown.dart';
import 'package:sheba_plus/view/components/custom_phone_number_field.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';
import 'package:sheba_plus/view/global_texts.dart';
import 'package:sheba_plus/view/profile/saved-address/controller/address_controller.dart';
import 'package:sheba_plus/view/styles.dart';

class RegisterAddressForm extends StatefulWidget {
  const RegisterAddressForm({super.key});

  @override
  State<RegisterAddressForm> createState() => _RegisterAddressFormState();
}

class _RegisterAddressFormState extends State<RegisterAddressForm> {
  final formKey = GlobalKey<FormState>();
  final addressController = Get.find<AddressController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Obx(() {
            int validationNumberLength =
                addressController.addressMobileNumberLength.value;

            return CustomPhoneField(
              onCountryChanged: (Country country) {
                addressController.addressMobileNumberLength.value =
                    country.minLength;
              },
              onChanged: (PhoneNumber phoneNumber) {
                addressController.addressMobileNumber.value =
                    phoneNumber.number;
                addressController.addressCountryCode.value =
                    phoneNumber.countryCode;
                addressController.addressCountry.value =
                    phoneNumber.countryISOCode;
              },
              validator: (value) {
                if (value != null && value.number.isEmpty) {
                  return "Phone number required";
                } else if (value?.number.length != validationNumberLength) {
                  return "Phone number should container $validationNumberLength digits";
                }
                return null;
              },
            );
          }),
          16.kH,
          CustomTextField(
              controller: addressController.addressStreetController.value,
              hintText: "${AuthScreenText.streetAddress}*",
              validator: (value) => InputValidators.generalValidator(
                  value: value,
                  message: AuthScreenText.streetAddressValidatorText)),
          16.kH,
          CustomTextField(
            controller: addressController.addressStreet2Controller.value,
            hintText: "${AuthScreenText.streetAddress} 2",
          ),
          16.kH,
          CustomTextField(
              controller: addressController.addressCityController.value,
              hintText: "${AuthScreenText.cityTown}*",
              validator: (value) => InputValidators.generalValidator(
                  value: value, message: AuthScreenText.cityTownValidatorText)),
          16.kH,
          Obx(
            () => CustomDropdown(
              items: const [
                "Bangladesh",
                "Canada",
              ],
              onChanged: (value) =>
                  addressController.addressSelectedCountry(value),
              selectedValue: addressController.addressSelectedCountry.value,
              borderColor: AppColors.border,
              hintText: "${AuthScreenText.country}*",
              validator: (value) {
                if (addressController.addressSelectedCountry.value.isEmpty) {
                  return AuthScreenText.countryValidatorText;
                }
                return null;
              },
            ),
          ),
          16.kH,
          Obx(
            () => CustomDropdown(
              items: const ["State 1", "State B", "State D"],
              onChanged: (value) =>
                  addressController.addressSelectedState(value),
              selectedValue: addressController.addressSelectedState.value,
              borderColor: AppColors.border,
              hintText: "${AuthScreenText.state}*",
              validator: (value) {
                if (addressController.addressSelectedState.isEmpty) {
                  return AuthScreenText.stateValidatorText;
                }
                return null;
              },
            ),
          ),
          16.kH,
          CustomTextField(
            controller: addressController.addressZipCodeController.value,
            hintText: "${AuthScreenText.postalOrZip}*",
            textInputType: TextInputType.number,
            validator: (value) => InputValidators.generalValidator(
                value: value, message: AuthScreenText.postalOrZipValidatorText),
          ),
          16.kH,
          TextField(
            maxLines: 10, // Allows multiple lines
            minLines: 5, // Minimum height
            decoration: Styles.getTextFieldInputDecoration(
              context: context,
              fillColor: AppColors.white,
              hintText: AuthScreenText.additionalInfo,
            ),
          ),
          24.kH,
          Obx(
            () => CustomPrimaryButton(
              loading: addressController.addressCreateLoading.isTrue,
              label: GlobalTexts.saveAndContinue,
              onClick: () {
                if (formKey.currentState!.validate()) {
                  saveAddress();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  void saveAddress() async {
    final response = await addressController.createAddress(title: "Home");
    if (response) {
      addressController.resetAddressFields();
      Get.offAndToNamed(Routes.referral);
      Utils.showSuccessToast(message: AuthScreenText.homeAddressSaved);
    }
  }
}
