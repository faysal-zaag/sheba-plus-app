import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/setting/setting.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/logger.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/view/auth/widgets/modals/terms_and_condition_modal.dart';
import 'package:sheba_plus/view/styles.dart';
import 'package:sheba_plus/view_model/repositories/global.repository.dart';

import '../view/components/custom_common_modal_sheet_parent_widget.dart';
import '../view/components/redeem_point_modal_sheet.dart';

class GlobalController extends GetxController {
  final GlobalRepository _globalRepository;

  GlobalController(this._globalRepository);

  final termsAccepted = false.obs;
  final appSetting = const Setting().obs;
  final getDefaultSettingLoading = true.obs;

  final redirectScreen = Routes.home.obs;

  void showTermsAndConditionSheet(
      {required BuildContext context, required int serviceIndex}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return CustomCommonModalSheetParentWidget(
          children: [
            TermsAndConditionSheet(
              serviceIndex: serviceIndex,
            ),
          ],
        );
      },
    );
  }

  Future<void> getDefaultSetting() async {
    try {
      final response = await _globalRepository.getDefaultSetting();
      appSetting(Setting.fromJson(response.data));
    } catch (e) {
      Log.error(e.toString());
    } finally {
      getDefaultSettingLoading(false);
    }
  }

  showRedeemPointModalSheet(
      {required BuildContext context,
      required double totalDue,
      required int totalRedeemPoints}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) {
          return CustomCommonModalSheetParentWidget(
            children: [
              RedeemPointModalSheet(
                onNoPress: () {
                  Get.back();
                },
                onYesPress: () {},
                totalDue: 150.0,
                totalPoints: 80000,
              )
            ],
          );
        });
  }

  Future<void> showDateTimePicker(
      {required BuildContext context,
        bool canadianTime = false,
        DateTime? initialDate,
        DateTime? firstDate,
        DateTime? lastDate,
        required Function(DateTime, bool) onPicked
      }) async {
    DateTime now = DateTime.now();

    // Show Date Picker
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: firstDate ?? now,
      lastDate: lastDate ?? DateTime(2500),
      builder: (context, child) {
        return Styles.getDateTimePickerTheme(context, child);
      },
    );

    if (pickedDate != null) {
      // Show Time Picker
      print("ID => $initialDate");

      TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: TimeOfDay.fromDateTime(initialDate ?? now),
        builder: (context, child) {
          return Styles.getDateTimePickerTheme(context, child);
        },
      );

      if (pickedTime != null) {
        DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        onPicked(selectedDateTime, canadianTime);
      }
    }
  }

  Future<void> showDatePickerOnly(
      {required BuildContext context,
        DateTime? initialDate,
        DateTime? firstDate,
        DateTime? lastDate,
        required Function(DateTime) onPicked
      }) async {
    DateTime now = DateTime.now();

    // Show Date Picker
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: firstDate ?? now,
      lastDate: lastDate ?? DateTime(2500),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if(pickedDate != null)
    {
      onPicked(pickedDate);
    }
  }
}
