import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/setting/setting.dart';
import 'package:sheba_plus/utils/logger.dart';
import 'package:sheba_plus/view/auth/widgets/modals/terms_and_condition_modal.dart';
import 'package:sheba_plus/view_model/repositories/global.repository.dart';

import '../view/components/custom_common_modal_sheet_parent_widget.dart';
import '../view/components/redeem_point_modal_sheet.dart';

class GlobalController extends GetxController {
  final GlobalRepository _globalRepository;

  GlobalController(this._globalRepository);

  final termsAccepted = false.obs;
  final appSetting = const Setting().obs;
  final getDefaultSettingLoading = true.obs;

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
        //   Stack(
        //   children: [
        //     BackdropFilter(
        //       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        //       child: Container(
        //         color: Colors.black.withOpacity(0.1), // Optional dark overlay
        //       ),
        //     ),
        //     Align(
        //       alignment: Alignment.bottomCenter,
        //       // Ensures it sticks to the bottom
        //       child: Container(
        //         decoration: const BoxDecoration(
        //           color: AppColors.background,
        //           borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        //         ),
        //         padding: EdgeInsets.only(
        //           bottom: MediaQuery.of(context)
        //               .viewInsets
        //               .bottom, // Keyboard safe area
        //         ),
        //         child: Wrap(
        //           children: [
        //             TermsAndConditionSheet(
        //               serviceIndex: serviceIndex,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // );
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
}
