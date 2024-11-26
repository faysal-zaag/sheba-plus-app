import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';

class CustomOtpFields extends StatelessWidget {
  final GlobalKey formKey;
  CustomOtpFields({
    super.key, required this.formKey,
  });

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Form(
        key: formKey,
        child: PinCodeTextField(
          appContext: context,
          pastedTextStyle: const TextStyle(
            color: AppColors.subtext,
            fontWeight: FontWeight.bold,
          ),
          length: 6,
          obscureText: true,
          obscuringCharacter: '•',
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          validator: (v) {
            if (v == null || v.isEmpty) {
              return "Field cannot be empty";
            } else if (v.length < 6) {
              return "Please enter the full 6-digit OTP";
            }
            return null;
          },
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(2),
            fieldHeight: 41,
            fieldWidth: 41,
            activeColor: AppColors.primary,
            activeFillColor: AppColors.white,
            inactiveFillColor: AppColors.white,
            selectedFillColor: AppColors.white,
            selectedColor: AppColors.primary,
            errorBorderColor: AppColors.error,
          ),
          cursorColor: Colors.black,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          keyboardType: TextInputType.number,
          boxShadows: const [
            BoxShadow(
              offset: Offset(0, 1),
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
          onCompleted: (code) {
            debugPrint("Completed $code");
          },
          onChanged: (value) => authController.registerOtpCode(value),
          beforeTextPaste: (text) {
            return true;
          },
        ),
      ),
    );
  }
}
