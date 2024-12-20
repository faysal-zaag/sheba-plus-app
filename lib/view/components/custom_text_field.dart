import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/view/styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final String? hintText;
  final bool readOnly;
  final bool isRequired;
  final bool? obscure;
  final bool isExpand;
  final int maxLine;
  final int? maxLength;
  final Color color;
  final double borderRadius;
  final TextInputType textInputType;
  final Function? onValue;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final BorderRadius? customBorder;
  final VoidCallback? onTap;
  final AutovalidateMode? autoValidateMode;

  const CustomTextField(
      {super.key, this.controller,
      this.title,
      this.hintText,
      this.readOnly = false,
      this.isRequired = false,
      this.isExpand = false,
      this.color = AppColors.white,
      this.borderRadius = 6.0,
      this.maxLine = 1,
      this.textInputType = TextInputType.text,
      this.onValue,
      this.validator,
      this.onChange,
      this.inputFormatters,
      this.suffixIcon,
      this.obscure,
      this.customBorder,
      this.maxLength = 100,
      this.onTap,
      this.autoValidateMode,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure ?? false,
      autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.primary,
      decoration: Styles.getTextFieldInputDecoration(
        context: context,
        fillColor: color,
        borderRadius: borderRadius,
        customBorder: customBorder,
        hintText: hintText,
        prefixIcon: prefixIcon,
        readOnly: readOnly,
        suffixIcon: suffixIcon,
      ),
      onTap: onTap,
      onChanged: onChange,
      controller: controller,
      readOnly: readOnly,
      validator: validator,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      style: Theme.of(context).textTheme.titleSmall,
      maxLines: maxLine,
    );
  }
}
