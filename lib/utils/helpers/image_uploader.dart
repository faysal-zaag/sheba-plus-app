import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';
import 'package:sheba_plus/view/profile/controller/profile_controller.dart';

class ImageUploader extends StatelessWidget {
  ImageUploader({super.key, this.file});

  final profileController = Get.find<ProfileController>();
  final picker = ImagePicker();
  final XFile? file;

  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    final file = await picker.pickImage(source: source, imageQuality: 50);

    if (file != null) {
      bool status = await profileController.uploadProfilePicture(file: file);

      if (status) {
        Get.back();
        Utils.showSuccessToast(message: "Profile picture uploaded successfully.");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      child: Container(
          height: 150,
          padding: const EdgeInsets.all(20),
          child: Obx(
                () => profileController.loadingUploadingPicture.value
                ? const CustomLoader()
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _pickImage(ImageSource.camera, context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_a_photo,
                        size: 40,
                        color: AppColors.primary,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Open Camera'.tr,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 2,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _pickImage(ImageSource.gallery, context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add_photo_alternate,
                        size: 40,
                        color: AppColors.primary,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Open Gallery'.tr,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
