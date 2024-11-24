import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/device/device_utility.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/auth/widgets/custom_auth_option.dart';
import 'package:sheba_plus/view/auth/widgets/custom_auth_option.dart';
import 'package:sheba_plus/view/auth/widgets/custom_auth_option.dart';

class SocialLoginOptions extends StatelessWidget {
  SocialLoginOptions({super.key});

  final authController = Get.find<AuthController>();

  facebookLogin() async {
    bool status = await authController.facebookLogin();

    if (status) {
      Get.back();
    }
  }

  googleLogin() async {
    bool status = await authController.googleLogin();

    if (status) {
      Get.back();
    }
  }

  appleLogin() async {
    bool status = await authController.appleLogin();

    if (status) {
      Get.back();
    }
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
        if (DeviceUtils.isIOS())
          Expanded(
            child: CustomAuthOption(
                imagePath: AppImages.apple, onTap: appleLogin),
          ),
        if (Platform.isIOS) 16.kW,
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
