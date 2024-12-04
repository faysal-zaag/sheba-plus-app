import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/models/setting/setting.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/logger.dart';
import 'package:sheba_plus/view/auth/widgets/modals/terms_and_condition_modal.dart';
import 'package:sheba_plus/view_model/repositories/global.repository.dart';

class GlobalController extends GetxController {
  final GlobalRepository _globalRepository;

  GlobalController(this._globalRepository);

  final termsAccepted = false.obs;
  final appSetting = const Setting().obs;
  final getDefaultSettingLoading = true.obs;

  void showTermsAndConditionSheet({required BuildContext context, required int serviceIndex}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.1), // Optional dark overlay
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter, // Ensures it sticks to the bottom
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom, // Keyboard safe area
                ),
                child: Wrap(
                  children: [
                    TermsAndConditionSheet(serviceIndex: serviceIndex,),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> getDefaultSetting() async {
    try{
      final response = await _globalRepository.getDefaultSetting();
      appSetting(Setting.fromJson(response.data));
    }
    catch(e){
      Log.error(e.toString());
    }
    finally{
      getDefaultSettingLoading(false);
    }
  }
}
