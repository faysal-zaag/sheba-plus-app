import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';

class DialogHelper {
  //show error dialog
  static void showErrorDialog({String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.headlineSmall,
              ),
              Text(
                description ?? '',
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showNoInternetDialog({required Function checkInternet}) {
    Get.dialog(
      barrierDismissible: false,
      Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: AppBorderRadius.circularRadius2
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(PhosphorIcons.wifiSlash(), color: AppColors.primary, size: 50,),
              20.kH,
              Text("No Internet connection found", style: GoogleFonts.poppins(color: AppColors.subtext)),
              Text("Check your connection", style: GoogleFonts.poppins(color: AppColors.subtext)),
              32.kH,
              CustomPrimaryButton(label: "Try Again", onClick: (){
                hideLoading();
                checkInternet();
              })
            ],
          ),
        ),
      ),
    );
  }
  
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.circularRadius2
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomLoader(),
              const SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading({int? id}) {
    if (Get.isDialogOpen!) Get.back(id: id);
  }
  
}