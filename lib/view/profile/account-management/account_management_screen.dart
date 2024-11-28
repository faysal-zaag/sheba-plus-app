import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/helpers/image_uploader.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/components/image/custom_image.dart';
import 'package:sheba_plus/view/components/text_field_with_label.dart';
import 'package:sheba_plus/view/profile/controller/profile_controller.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/styles.dart';

class AccountManagementScreen extends StatefulWidget {
  const AccountManagementScreen({super.key});

  @override
  State<AccountManagementScreen> createState() => _AccountManagementScreenState();
}

class _AccountManagementScreenState extends State<AccountManagementScreen> {
  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: AppPaddings.screenPadding,
        decoration: Styles.roundedWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CustomCachedNetworkImage(
                    height: 100,
                    width: 100,
                    imageUrl: profileController.user.value.profilePicture,
                    isCircular: true,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: showImageUploaderDialog,
                      child: Container(
                        height: 36,
                        width: 36,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryLight),
                        child: Center(
                          child: Icon(
                            PhosphorIcons.camera(),
                            size: 20,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            16.kH,
            Obx(
                  () => TextFieldWithLabel(
                controller:
                profileController.userFirstNameController.value,
                label: AuthScreenText.firstName,
                hintText: "",
                readOnly: profileController.profileEditable.isFalse,
              ),
            ),
            Obx(
                  () => TextFieldWithLabel(
                  controller:
                  profileController.userLastNameController.value,
                  label: AuthScreenText.lastName,
                  hintText: "",
                  readOnly:
                  profileController.profileEditable.isFalse),
            ),
            Obx(
                  () => TextFieldWithLabel(
                controller:
                profileController.userEmailController.value,
                label: AuthScreenText.emailId,
                hintText: "",
                readOnly: profileController.profileEditable.isFalse,
              ),
            ),
            Obx(
                  () => TextFieldWithLabel(
                  controller: profileController
                      .userPhoneNumberController.value,
                  label: AuthScreenText.phoneNumber,
                  hintText: "",
                  readOnly:
                  profileController.profileEditable.isFalse),
            ),
            Obx(
                  () => TextFieldWithLabel(
                  controller: profileController
                      .userDateOfBirthController.value,
                  label: ProfileScreenTexts.dateOfBirth,
                  hintText: "",
                  readOnly:
                  profileController.profileEditable.isFalse),
            ),
            CustomPrimaryButton(
              label: AuthScreenText.changePassword,
              onClick: () {},
              color: AppColors.white,
              borderColor: AppColors.black,
              labelColor: AppColors.black,
            ),
            16.kH,
            Obx(
                  () => CustomPrimaryButton(
                label: profileController.profileEditable.isTrue
                    ? ProfileScreenTexts.saveChanges
                    : ProfileScreenTexts.updateInformation,
                onClick: () => profileController.profileEditable(
                    !profileController.profileEditable.value),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showImageUploaderDialog() async {
    showDialog(
        context: context,
        builder: (context) {
          return ImageUploader();
        });
  }
}
