import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/register_screen/register-address/widget/register_address_form.dart';
import 'package:sheba_plus/view/components/primary_scaffold.dart';
import 'package:sheba_plus/view/styles.dart';

class RegisterAddressScreen extends StatelessWidget {
  const RegisterAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: AppPaddings.screenPadding,
        child: Container(
          decoration: Styles.roundedWhite,
          padding: AppPaddings.allPadding16,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AuthScreenText.registerAddressHeader,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 20),
                ),
                24.kH,
                const RegisterAddressForm(withPhoneField: true,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
