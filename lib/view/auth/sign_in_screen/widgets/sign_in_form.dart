import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/controllers/global_controller.dart';
import 'package:sheba_plus/data/services/storage_service.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/utils/validators/input_validators.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/components/custom_password_field.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';
import 'package:sheba_plus/view/profile/saved-address/controller/address_controller.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _signInFormKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();
  final storageService = Get.find<StorageService>();
  final addressController = Get.find<AddressController>();
  final globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signInFormKey,
      child: Column(
        children: [
          TextFieldWithLabel(
            controller: authController.signInEmailController.value,
            label: AuthScreenText.emailId,
            hintText: AuthScreenText.emailIdHintText,
            validator: (value) => InputValidators.emailValidator(value),
          ),
          Obx(
            () => CustomPasswordField(
              label: AuthScreenText.password,
              controller: authController.signInPasswordController.value,
              obscure: authController.signInPasswordObscure.value,
              setObscure: authController.onSignInObscureTap,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(
                    () => InkWell(
                      onTap: authController.onKeepLoggedInTap,
                      child: Icon(
                        authController.keepLoggedIn.value
                            ? PhosphorIcons.checkSquare(PhosphorIconsStyle.fill)
                            : PhosphorIcons.square(),
                        color: authController.keepLoggedIn.value
                            ? AppColors.primary
                            : AppColors.subtext,
                        size: 20,
                      ),
                    ),
                  ),
                  4.kW,
                  Text(
                    AuthScreenText.keepMeLoggedIn,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: 14),
                  )
                ],
              ),
              if(storageService.getLanguage() != "bn")
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.forgetPassword);
                },
                child: Text(
                  AuthScreenText.forgotPasswordQ,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 14, color: AppColors.primary),
                ),
              )
            ],
          ),
          24.kH,
          if(storageService.getLanguage() == "bn")
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.forgetPassword);
              },
              child: Text(
                AuthScreenText.forgotPasswordQ,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 14, color: AppColors.primary),
              ),
            ),
          24.kH,
          Obx(
            () => CustomPrimaryButton(
              loading: authController.signInProcedureLoading.isTrue,
              label: AuthScreenText.signIn,
              onClick: login,
            ),
          )
        ],
      ),
    );
  }

  void login() async {
    if (_signInFormKey.currentState!.validate()) {
      final response = await authController.login();
      if (response) {
        authController.cleanSignInData();
        if(addressController.hasSavedAddress.isTrue) {
          Get.offAndToNamed(globalController.redirectScreen.value);
        } else {
          Get.offAndToNamed(Routes.registerAddress);
        }
        Utils.showSuccessToast(message: AuthScreenText.loggedInSuccessMessage);
      }
    }
  }
}
