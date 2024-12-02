import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/styles.dart';

class CustomPhoneField extends StatelessWidget {
  final bool? required;
  final String? label;
  final TextStyle? labelStyle;
  final Function(PhoneNumber)? onChanged;
  final Function(Country)? onCountryChanged;
  final TextInputType? textInputType;
  final String? Function(PhoneNumber?)? validator;

  const CustomPhoneField({
    super.key,
    this.required = true,
    this.label,
    required this.onChanged,
    this.labelStyle,
    this.textInputType, this.onCountryChanged, this.validator,
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
                style: labelStyle ?? Theme.of(context).textTheme.bodyMedium,
              ),
              if (required == true)
                const Text(
                  " *",
                  style: TextStyle(color: AppColors.error),
                ),
            ],
          ),
        8.kH,
        IntlPhoneField(
          decoration: Styles.getTextFieldInputDecoration(
            context: context,
            fillColor: AppColors.white,
          ),
          initialCountryCode: 'BD',
          onCountryChanged: onCountryChanged,
          pickerDialogStyle: PickerDialogStyle(
            backgroundColor: Colors.white,
            countryNameStyle: Theme.of(context).textTheme.titleSmall,
            countryCodeStyle: Theme.of(context).textTheme.titleSmall,
            searchFieldInputDecoration: const InputDecoration(
              hintText: 'Search country',
            ),
          ),
          validator: validator,
          style: Theme.of(context).textTheme.titleSmall,
          onChanged: onChanged,
          disableLengthCheck: true,
        ),
      ],
    );
  }
}
