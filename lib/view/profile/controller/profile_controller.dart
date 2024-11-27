import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/user/user.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';

class ProfileController extends GetxController{
  final user = const User().obs;

  final profileEditable = false.obs;
  final loadingUploadingPicture = false.obs;
  final selectedProfileMenu = AppConstants.profileMenuList[0].obs;

  final userFirstNameController = TextEditingController().obs;
  final userLastNameController = TextEditingController().obs;
  final userEmailController = TextEditingController().obs;
  final userPhoneNumberController = TextEditingController().obs;
  final userDateOfBirthController = TextEditingController().obs;

  // Future<bool> uploadProfilePicture({required XFile file}) async {
  //   try {
  //     loadingUploadingPicture(true);
  //     final response = await FileService.uploadImage(file);
  //     String imageKey = response.data["keys"][0];
  //     await ProfileService.changeProfileImage(imageKey: imageKey);
  //     updateProfilePicture(imageKey: imageKey);
  //     return true;
  //   } catch (err) {
  //     return false;
  //   }
  //   finally{
  //     loadingUploadingPicture(false);
  //   }
  // }
}