import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
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
  final Function? onTap;
  final AutovalidateMode? autoValidateMode;

  const CustomTextField(
      {super.key,
      required this.textEditingController,
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
      decoration: InputDecoration(
          focusedBorder: readOnly == true
              ? OutlineInputBorder(
                  borderRadius:
                      customBorder ?? BorderRadius.circular(borderRadius),
                  borderSide:
                      const BorderSide(color: AppColors.border, width: 1.0),
                )
              : OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.primary, width: 1.0),
                  borderRadius:
                      customBorder ?? BorderRadius.circular(borderRadius),
                ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.error, width: 1.0),
            borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
                color: const Color(0xff000000).withOpacity(0.1), width: 1.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
                color: const Color(0xff000000).withOpacity(0.1), width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.error, width: 1.0),
            borderRadius: customBorder ?? BorderRadius.circular(borderRadius),
          ),
          contentPadding: const EdgeInsets.only(bottom: 0.0, top: 15.0),
          prefix: const Padding(
            padding: EdgeInsets.only(left: 15.0),
          ),
          errorStyle: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: AppColors.error),
          fillColor: color,
          filled: true,
          hintText: hintText ?? "",
          hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.hintText),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon),
      onChanged: onChange,
      controller: textEditingController,
      readOnly: readOnly,
      validator: validator,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      style: const TextStyle(fontSize: 15, color: AppColors.black),
      maxLines: maxLine,
    );
  }
}
