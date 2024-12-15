import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/validators/input_validators.dart';
import 'package:sheba_plus/view/components/custom_dropdown.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';
import 'package:sheba_plus/view/styles.dart';

class CustomPhoneField extends StatelessWidget {
  final bool? required;
  final String? label;
  final TextStyle? labelStyle;
  final TextEditingController? controller;
  final Function(String) onCountryChanged;
  final TextInputType? textInputType;
  final String selectedCountryCode;
  final int validatorNumberLength;
  final String? Function(String?)? onChange;

  const CustomPhoneField({
    super.key,
    this.required = true,
    this.label,
    this.labelStyle,
    this.textInputType,
    required this.onCountryChanged,
    required this.onChange,
    this.controller,
    this.selectedCountryCode = "+880",
    this.validatorNumberLength = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          Row(
            children: [
              Text(
                label ?? "",
                style: labelStyle ?? Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColors.blackTitle, fontSize: 14),
              ),
              if (required == true)
                const Text(
                  " *",
                  style: TextStyle(color: AppColors.error),
                ),
            ],
          ),
        8.kH,
        CustomTextField(
          prefixIcon: Container(
            margin: const EdgeInsets.all(1.0),
            height: 48,
            width: 80,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: AppColors.border),
              ),
            ),
            child: CustomDropdown(
              borderColor: Colors.transparent,
              selectedValue: selectedCountryCode,
              items: AppConstants.countryCodeList,
              onChanged: (String? dialCode) {
                onCountryChanged(dialCode!);
              },
            ),
          ),
          textInputType: TextInputType.number,
          validator: (value) => InputValidators.phoneNumberValidator(value: value, validationNumberLength: validatorNumberLength),
          onChange: onChange,
          controller: controller,
        ),
      ],
    );
  }
}
