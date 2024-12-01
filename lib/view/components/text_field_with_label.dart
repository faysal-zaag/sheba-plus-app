import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_text_field.dart';

class TextFieldWithLabel extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final Widget? suffixIcon;
  final bool? obscure;
  final int? maxLine;
  final bool? required;
  final TextStyle? labelStyle;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool readOnly;
  final Function? onTap;
  final String? Function(String?)? onChange;

  const TextFieldWithLabel({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.suffixIcon,
    this.obscure,
    this.maxLine = 1,
    this.required = true,
    this.labelStyle,
    this.validator,
    this.textInputType,
    this.readOnly = false,
    this.onTap,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(context), // Refactored to a separate method
        8.kH, // Custom SizedBox extension
        CustomTextField(
          controller: controller,
          hintText: hintText,
          suffixIcon: suffixIcon,
          obscure: obscure ?? false,
          maxLine: maxLine ?? 1,
          textInputType: textInputType ?? TextInputType.text,
          validator: validator,
          readOnly: readOnly ?? false,
          onTap: onTap,
          onChange: onChange,
        ),
        20.kH, // Custom SizedBox extension
      ],
    );
  }

  Widget _buildLabel(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: labelStyle ??
            Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.blackTitle),
        children: [
          TextSpan(text: label), // Regular label text
          if (required == true && readOnly == false)
            const TextSpan(
              text: " *", // Required marker
              style: TextStyle(color: AppColors.error), // Error color for the "*"
            ),
        ],
      ),
    );
  }
}
