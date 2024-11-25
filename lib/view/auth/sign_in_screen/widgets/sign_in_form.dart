import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/utils/validators/input_validators.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
import 'package:sheba_plus/view/components/custom_password_field.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _signInFormKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

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
              GestureDetector(
                onTap: (){
                  Get.toNamed(Routes.forgetPassword);
                },
                child: Text(
                  AuthScreenText.forgetPassword,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 14, color: AppColors.primary),
                ),
              )
            ],
          ),
          24.kH,
          CustomPrimaryButton(
              label: AuthScreenText.signIn,
              onClick: () {
                if (_signInFormKey.currentState!.validate()) {
                  authController.login();
                }
              })
        ],
      ),
    );
  }
}
