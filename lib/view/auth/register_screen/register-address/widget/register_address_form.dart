import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sheba_plus/models/address/address.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';
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
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/profile/saved-address/controller/address_controller.dart';
import 'package:sheba_plus/view/styles.dart';

class RegisterAddressForm extends StatefulWidget {
  final bool withPhoneField;
  final bool forUpdate;
  final int? addressId;

  const RegisterAddressForm({
    super.key,
    this.withPhoneField = false,
    this.forUpdate = false,
    this.addressId,
  });

  @override
  State<RegisterAddressForm> createState() => _RegisterAddressFormState();
}

class _RegisterAddressFormState extends State<RegisterAddressForm> {
  final _formKey = GlobalKey<FormState>();
  final addressController = Get.find<AddressController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (widget.withPhoneField)
            CustomPhoneField(
              onChange: (mobileNumber) {
                addressController.addressMobileNumber.value = mobileNumber!;
                return null;
              },
              onCountryChanged: (dialCode) {
                addressController.addressCountryCode.value = dialCode;
              },
            ),
          if (widget.withPhoneField) 16.kH,
          CustomTextField(
            controller: addressController.addressStreetController.value,
            hintText: "${AuthScreenText.streetAddress}*",
            validator: (value) => InputValidators.generalValidator(
              value: value,
              message: AuthScreenText.streetAddressValidatorText,
            ),
          ),
          16.kH,
          CustomTextField(
            controller: addressController.addressStreet2Controller.value,
            hintText: "${AuthScreenText.streetAddress} 2",
          ),
          16.kH,
          CustomTextField(
              controller: addressController.addressCityController.value,
              hintText: "${AuthScreenText.cityTown}*",
              validator: (value) => InputValidators.generalValidator(value: value, message: AuthScreenText.cityTownValidatorText)),
          16.kH,
          Obx(
            () => CustomDropdown(
              items: const ["Bangladesh", "Canada", "USA"],
              onChanged: (value) => addressController.addressSelectedCountry(value),
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
              onChanged: (value) => addressController.addressSelectedState(value),
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
            validator: (value) => InputValidators.generalValidator(value: value, message: AuthScreenText.postalOrZipValidatorText),
          ),
          16.kH,
          TextField(
            maxLines: 10,
            // Allows multiple lines
            minLines: 5,
            // Minimum height
            decoration: Styles.getTextFieldInputDecoration(
              context: context,
              fillColor: AppColors.white,
              hintText: AuthScreenText.additionalInfo,
            ),
            style: Theme.of(context).textTheme.titleSmall,
            controller: addressController.addressAdditionalInfo.value,
          ),
          24.kH,
          Obx(
            () => CustomPrimaryButton(
              loading: widget.forUpdate ? addressController.addressUpdateLoading.isTrue : addressController.addressCreateLoading.isTrue,
              label: widget.forUpdate ? ProfileScreenTexts.updateAddress : GlobalTexts.saveAndContinue,
              onClick: () {
                if (_formKey.currentState!.validate()) {
                  if (widget.forUpdate) {
                    updateAddress(addressId: widget.addressId ?? 0);
                  } else {
                    saveAddress();
                  }
                }
              },
            ),
          )
        ],
      ),
    );
  }

  void saveAddress() async {
    final response = await addressController.createAddress(title: "Home Address");
    if (response) {
      addressController.resetAddressFields();
      Get.offAndToNamed(Routes.referral);
      Utils.showSuccessToast(message: AuthScreenText.homeAddressSaved);
    }
  }

  void updateAddress({required int addressId}) async {
    final response = await addressController.updateAddress(addressId: addressId);
    if (response) {
      addressController.resetAddressFields();
      Get.back();
      Utils.showSuccessToast(message: ProfileScreenTexts.addressUpdated);
    }
  }
}
