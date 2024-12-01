import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/styles.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final Function(String?) onChanged;
  final String? selectedValue;
  final String hintText;
  final Color backgroundColor;
  final Color? borderColor;
  final double width;
  final double height;
  final double borderRadius;
  final IconData icon;
  final Color iconColor;
  final bool prefixIcon;
  final bool disableBorder;
  final bool readOnly;
  final List<PhosphorIconData> icons;
  final TextStyle? labelStyle;
  final Widget? customButton;
  final String? Function(String?)? validator;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.selectedValue,
    this.backgroundColor = AppColors.white,
    this.width = double.infinity,
    this.height = 48,
    this.borderRadius = 8,
    this.icon = Icons.keyboard_arrow_down,
    this.iconColor = AppColors.icon,
    this.prefixIcon = false,
    this.icons = const [],
    this.labelStyle,
    this.borderColor,
    this.hintText = 'Select Item',
    this.validator,
    this.readOnly = false, this.disableBorder = false, this.customButton,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<String>(
        customButton: customButton,
        decoration: Styles.getTextFieldInputDecoration(
                context: context, fillColor: backgroundColor)
            .copyWith(
          contentPadding: EdgeInsets.zero,
          prefix: const Padding(
            padding: EdgeInsets.only(left: 0),
          ),
        ),
        validator: validator,
        iconStyleData: IconStyleData(
          icon: Icon(
            icon,
            color: iconColor,
          ),
        ),
        isExpanded: true,
        hint: Text(
          hintText,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: AppColors.hintText),
        ),
        items: items
            .asMap()
            .entries
            .map(
              (entry) => DropdownMenuItem<String>(
                value: entry.value, // The item value
                child: Row(
                  children: [
                    if (prefixIcon)
                      Icon(
                        icons[entry.key],
                        // Accessing icon using index
                        size: 20,
                      ),
                    8.kW,
                    Text(
                      entry.value, // The item text
                      style:
                          labelStyle ?? Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            )
            .toList(),
        value: selectedValue,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          // decoration: BoxDecoration(
          //     color: backgroundColor,
          //     border: Border.all(color: borderColor ?? Colors.transparent),
          //     borderRadius: BorderRadius.circular(borderRadius)),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: height,
          width: width,
        ),
        dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(borderRadius))),
        menuItemStyleData: const MenuItemStyleData(
          height: 56,
        ),
      ),
    );
  }
}
