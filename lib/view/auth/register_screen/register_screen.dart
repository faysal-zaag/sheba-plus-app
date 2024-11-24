import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/register_screen/widgets/register_form.dart';
import 'package:sheba_plus/view/auth/sign_in_screen/widgets/sign_in_form.dart';
import 'package:sheba_plus/view/auth/widgets/social_login_options.dart';
import 'package:sheba_plus/view/components/custom_appbar.dart';
import 'package:sheba_plus/view/styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(
        userIcon: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: screenWidth,
                padding: const EdgeInsets.all(16.0),
                decoration: Styles.decorationWithBoxShadow,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AuthScreenText.registerAccount,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    4.kH,
                    Text(
                      AuthScreenText.signInNotice,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: AppColors.paragraph),
                    ),
                    24.kH,
                    RegisterForm(),
                    12.kH,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                            child: Divider(
                              color: AppColors.border,
                            )),
                        12.kW,
                        Text(
                          AuthScreenText.or,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: AppColors.paragraph),
                        ),
                        12.kW,
                        const Expanded(
                            child: Divider(
                              color: AppColors.border,
                            ))
                      ],
                    ),
                    12.kH,
                    SocialLoginOptions(),
                    24.kH,
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall, // Default text style
                          children: [
                            TextSpan(
                              text: "${AuthScreenText.alreadyHaveAnAccount} ",
                            ),
                            TextSpan(
                              text: AuthScreenText.signIn,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: AppColors.primary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.offAndToNamed(
                                    Routes.signIn,
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
