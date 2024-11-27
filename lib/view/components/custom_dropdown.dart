import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final Function(String?) onChanged;
  final String selectedValue;
  final Color backgroundColor;
  final double width;
  final double height;
  final double borderRadius;
  final IconData icon;
  final Color iconColor;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.selectedValue,
    this.backgroundColor = AppColors.white,
    this.width = double.infinity,
    this.height = 56,
    this.borderRadius = 8,
    this.icon = Icons.keyboard_arrow_down,
    this.iconColor = AppColors.icon,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        iconStyleData: IconStyleData(
          icon: Icon(
            icon,
            color: iconColor,
          ),
        ),
        isExpanded: true,
        hint: Text(
          'Select Item',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        items: items
            .asMap()
            .entries
            .map(
              (entry) => DropdownMenuItem<String>(
                value: entry.value, // The item value
                child: Row(
                  children: [
                    Icon(
                      AppConstants.profileMenuIcons[entry.key],
                      // Accessing icon using index
                      size: 20,
                    ),
                    8.kW,
                    Text(
                      entry.value, // The item text
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            )
            .toList(),
        value:selectedValue,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius)),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: height,
          width: width,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)
          )
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 56,
        ),
      ),
    );
  }
}
