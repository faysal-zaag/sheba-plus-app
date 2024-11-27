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
  final bool? readOnly;
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
    this.readOnly,
    this.onTap,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: labelStyle ??
                  Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: AppColors.blackTitle),
            ),
            if (required == true && readOnly == false)
              const Text(
                " *",
                style: TextStyle(color: AppColors.error),
              ),
          ],
        ),
        8.kH,
        CustomTextField(
          textInputType: textInputType ?? TextInputType.text,
          obscure: obscure ?? false,
          suffixIcon: suffixIcon,
          hintText: hintText,
          textEditingController: controller,
          maxLine: maxLine ?? 1,
          validator: validator,
          readOnly: readOnly ?? false,
          onChange: onChange,
        ),
        20.kH,
      ],
    );
  }
}
