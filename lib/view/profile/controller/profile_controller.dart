import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sheba_plus/models/user/user.dart';
import 'package:sheba_plus/services/file_service.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';
import 'package:sheba_plus/utils/logger.dart';
import 'package:sheba_plus/view/profile/account-management/account_management_screen.dart';
import 'package:sheba_plus/view/profile/notification/notification_screen.dart';
import 'package:sheba_plus/view/profile/order-history/order_history_screen.dart';
import 'package:sheba_plus/view/profile/reward-points/reward_points_screen.dart';
import 'package:sheba_plus/view/profile/saved-address/saved_address_screen.dart';
import 'package:sheba_plus/view_model/repositories/profile.repository.dart';

class ProfileController extends GetxController {
  final ProfileRepository _profileRepository;
  final FileService _fileService;

  ProfileController(this._profileRepository, this._fileService);

  final user = const User().obs;

  final profileEditable = false.obs;
  final loadingUpdatingUserInfo = false.obs;
  final loadingUploadingPicture = false.obs;
  final changePasswordProcedureLoading = false.obs;
  final selectedProfileMenu = AppConstants.profileMenuList[0].tr.obs;
  final selectedProfileMenuIndex = 0.obs;

  final userFirstNameController = TextEditingController().obs;
  final userLastNameController = TextEditingController().obs;
  final userEmailController = TextEditingController().obs;
  final userPhoneNumberController = TextEditingController().obs;
  final userPhoneNumberValidationLength = 10.obs;
  final userPhoneNumberCountryCode = "".obs;
  final userDateOfBirthController = TextEditingController().obs;
  final userDateOfBirthInMilliseconds = 0.obs;

  final oldPasswordController = TextEditingController().obs;
  final newPasswordController = TextEditingController().obs;
  final confirmNewPasswordController = TextEditingController().obs;

  final oldPasswordObscure = true.obs;
  final newPasswordObscure = true.obs;
  final confirmNewPasswordObscure = true.obs;

  final List<Widget> screens = [
    const AccountManagementScreen(),
    SavedAddressScreen(),
    const OrderHistoryScreen(),
    const RewardPointsScreen(),
    const NotificationScreen(),
  ];

  void resetChangePasswordFields() {
    oldPasswordController.value.clear();
    newPasswordController.value.clear();
    confirmNewPasswordController.value.clear();
  }

  void onOldPasswordObscureTap() {
    oldPasswordObscure(!oldPasswordObscure.value);
  }

  void onNewPasswordObscureTap() {
    newPasswordObscure(!newPasswordObscure.value);
  }

  void onConfirmNewPasswordObscureTap() {
    confirmNewPasswordObscure(!confirmNewPasswordObscure.value);
  }

  Widget getCurrentScreen(){
    return screens[selectedProfileMenuIndex.value];
  }

  Future<bool> updateUserInfo() async {
    try {
      loadingUpdatingUserInfo(true);
      User userInfo = user.value.copyWith(
        firstName: userFirstNameController.value.text,
        lastName: userLastNameController.value.text,
        dateOfBirth: userDateOfBirthInMilliseconds.value,
        mobileNumber: userPhoneNumberController.value.text,
        countryCode: userPhoneNumberCountryCode.value
      );
      Log.info("${userInfo.toJson()}");
      final response = await _profileRepository.updateUserInfo(userInfo: userInfo);
      user(User.fromJson(response.data["info"]));
      return true;
    } catch (err) {
      Log.error(err.toString());
      return false;
    } finally {
      loadingUpdatingUserInfo(false);
    }
  }

  Future<bool> uploadProfilePicture({required XFile file}) async {
    try {
      loadingUploadingPicture(true);
      final response = await _fileService.uploadImage(file: file);
      String imageKey = response.data["keys"][0];
      await _profileRepository.changeProfileImage(imageKey: imageKey);
      // updateProfilePicture(imageKey: imageKey);
      return true;
    } catch (err) {
      return false;
    } finally {
      loadingUploadingPicture(false);
    }
  }

  Future<bool> changePassword() async {
    try {
      changePasswordProcedureLoading(true);
      await _profileRepository.changePassword(
        oldPassword: oldPasswordController.value.text,
        newPassword: newPasswordController.value.text,
      );
      return true;
    } catch (e) {
      Log.error(e.toString());
      return false;
    } finally {
      changePasswordProcedureLoading(false);
    }
  }
}
