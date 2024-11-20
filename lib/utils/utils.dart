import 'package:flutter/cupertino.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:toastification/toastification.dart';

class Utils{
  static void showToast({required String message, bool success = false, required Alignment alignment}) {
    toastification.show(
        title: Text(success ? "Success" : "Error"),
        description: Text(message),
        alignment: alignment,
        showProgressBar: false,
        style: ToastificationStyle.fillColored,
        type: success ? ToastificationType.success : ToastificationType.error,
        autoCloseDuration: const Duration(seconds: 5),
        primaryColor: success ? AppColors.primary : AppColors.error
    );
  }

  static void showSuccessToast({required String message, Alignment alignment = Alignment.bottomCenter}) {
    showToast(message: message, success: true, alignment: alignment);
  }

  static void showErrorToast({required String message, Alignment alignment = Alignment.bottomCenter}) {
    showToast(message: message, success: false, alignment: alignment);
  }
}