import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/validators/input_validators.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';

class CustomPasswordField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscure;
  final Function() setObscure;
  final bool? confirmPasswordField;
  final TextEditingController? passwordController;

  const CustomPasswordField(
      {super.key,
      required this.controller,
      required this.obscure,
      required this.setObscure,
      this.confirmPasswordField,
      this.passwordController,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFieldWithLabel(
      controller: controller,
      label: label,
      hintText: AuthScreenText.passwordHintText,
      obscure: obscure,
      suffixIcon: IconButton(
        onPressed: setObscure,
        icon: Icon(
          !obscure ? PhosphorIcons.eye() : PhosphorIcons.eyeSlash(),
          color: AppColors.subtext,
        ),
      ),
      validator: (value) {
        return confirmPasswordField == true
            ? InputValidators.confirmPasswordValidator(
                value, passwordController?.text)
            : InputValidators.passwordValidator(value);
      },
    );
  }
}
