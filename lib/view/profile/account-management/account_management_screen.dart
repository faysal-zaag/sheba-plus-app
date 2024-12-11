import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/controllers/global_controller.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/formatters/date_formatters.dart';
import 'package:sheba_plus/utils/helpers/image_uploader.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/view/auth/auth_screen_texts.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';
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
  final authController = Get.find<AuthController>();
  final profileController = Get.find<ProfileController>();
  final globalController = Get.find<GlobalController>();

  @override
  void dispose() {
    profileController.profileEditable(false);
    if(profileController.user.value.dateOfBirth == null || profileController.user.value.dateOfBirth == 0){
      profileController.userDateOfBirthController.value.clear();
      profileController.userDateOfBirthInMilliseconds(0);
    }
    super.dispose();
  }

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
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primaryLight),
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
                controller: profileController.userFirstNameController.value,
                label: AuthScreenText.firstName,
                hintText: "",
                required: profileController.profileEditable.isTrue,
                readOnly: profileController.profileEditable.isFalse,
              ),
            ),
            Obx(
              () => TextFieldWithLabel(
                  controller: profileController.userLastNameController.value,
                  label: AuthScreenText.lastName,
                  hintText: "",
                  required: profileController.profileEditable.isTrue,
                  readOnly: profileController.profileEditable.isFalse),
            ),
            Obx(
              () => TextFieldWithLabel(
                controller: profileController.userEmailController.value,
                label: AuthScreenText.emailId,
                hintText: "",
                readOnly: true,
              ),
            ),
            Obx(
              () => TextFieldWithLabel(controller: profileController.userPhoneNumberController.value, label: AuthScreenText.phoneNumber, hintText: "", readOnly: true),
            ),
            Obx(
              () => TextFieldWithLabel(
                controller: profileController.userDateOfBirthController.value,
                label: ProfileScreenTexts.dateOfBirth,
                hintText: "",
                required: profileController.profileEditable.isTrue,
                readOnly: true,
                onTap: () {
                  if (profileController.profileEditable.isTrue) {
                    globalController.showDatePickerOnly(
                      context: context,
                      onPicked: setDateOfBirth,
                      firstDate: DateTime(1800)
                    );
                  }
                },
              ),
            ),
            Obx(
              () => CustomPrimaryButton(
                loading: authController.forgetPasswordProcedureLoading.isTrue,
                label: AuthScreenText.changePassword,
                onClick: () async {
                  Get.toNamed(Routes.changePassword);
                },
                color: AppColors.white,
                borderColor: AppColors.black,
                labelColor: AppColors.black,
              ),
            ),
            16.kH,
            Obx(
              () => CustomPrimaryButton(
                loading: profileController.loadingUpdatingUserInfo.isTrue,
                label: profileController.profileEditable.isTrue ? ProfileScreenTexts.saveChanges : ProfileScreenTexts.updateInformation,
                onClick: () async{
                  if(profileController.profileEditable.isTrue){
                    final response = await profileController.updateUserInfo();
                    if(response){
                      Utils.showSuccessToast(message: "User information updated successfully");
                      profileController.profileEditable(false);
                    }
                  }
                  else{
                    profileController.profileEditable(true);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setDateOfBirth(DateTime selectedDate) {
    profileController.userDateOfBirthInMilliseconds.value = selectedDate.millisecondsSinceEpoch;
    profileController.userDateOfBirthController.value.text = DateFormatters.convertDateTimeToYYYYMMDD(dateTime: selectedDate);
  }

  void showImageUploaderDialog() async {
    showDialog(
        context: context,
        builder: (context) {
          return ImageUploader();
        });
  }
}
