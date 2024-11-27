import 'dart:io' if (dart.library.html) 'dart:html'; // Conditional imports for platform
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/device/device_utility.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/auth/widgets/custom_auth_option.dart';

class SocialLoginOptions extends StatelessWidget {
  SocialLoginOptions({super.key});

  final authController = Get.find<AuthController>();

  facebookLogin() async {
    bool status = await authController.facebookLogin();
    if (status) Get.back();
  }

  googleLogin() async {
    bool status = await authController.googleLogin();
    if (status) Get.back();
  }

  appleLogin() async {
    bool status = await authController.appleLogin();
    if (status) Get.back();
  }

  bool get isAppleLoginAvailable {
    // Check if running on iOS but not on Web
    if (kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.iOS;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomAuthOption(
            imagePath: AppImages.google,
            onTap: googleLogin,
          ),
        ),
        16.kW,
        if (isAppleLoginAvailable) // Use the safe platform check
          Expanded(
            child: CustomAuthOption(
              imagePath: AppImages.apple,
              onTap: appleLogin,
            ),
          ),
        if (isAppleLoginAvailable) 16.kW,
        Expanded(
          child: CustomAuthOption(
            imagePath: AppImages.facebook,
            onTap: facebookLogin,
          ),
        ),
      ],
    );
  }
}
