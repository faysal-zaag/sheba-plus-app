import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sheba_plus/models/user/user.dart';
import 'package:sheba_plus/services/file_service.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';
import 'package:sheba_plus/view/profile/account-management/account_management_screen.dart';
import 'package:sheba_plus/view/profile/order-history/order_history_screen.dart';
import 'package:sheba_plus/view/profile/saved-address/saved_address_screen.dart';
import 'package:sheba_plus/view_model/repositories/profile.repository.dart';

class ProfileController extends GetxController{
  final ProfileRepository _profileRepository;
  final FileService _fileService;

  ProfileController(this._profileRepository, this._fileService);

  final user = const User().obs;

  final profileEditable = false.obs;
  final loadingUploadingPicture = false.obs;
  final selectedProfileMenu = AppConstants.profileMenuList[0].obs;

  final userFirstNameController = TextEditingController().obs;
  final userLastNameController = TextEditingController().obs;
  final userEmailController = TextEditingController().obs;
  final userPhoneNumberController = TextEditingController().obs;
  final userDateOfBirthController = TextEditingController().obs;

  final Map<String, Widget> screens = {
    "Account Management": const AccountManagementScreen(),
    "Saved Address": const SavedAddressScreen(),
    "Order History": const OrderHistoryScreen(),
    "Reward Points": const OrderHistoryScreen(),
    "Notification": const OrderHistoryScreen(),
  };

  Widget getSelectedScreen() {
    return screens[selectedProfileMenu.value] ?? const Placeholder();
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
    }
    finally{
      loadingUploadingPicture(false);
    }
  }
}