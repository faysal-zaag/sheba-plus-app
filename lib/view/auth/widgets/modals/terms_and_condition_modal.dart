import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/controllers/global_controller.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/view/components/custom_close_button.dart';
import 'package:sheba_plus/view/components/custom_primary_button.dart';
import 'package:sheba_plus/view/global_texts.dart';
import 'package:sheba_plus/view/home/home_screen_texts.dart';

class TermsAndConditionSheet extends StatelessWidget {
  TermsAndConditionSheet({super.key});

  final globalController = Get.find<GlobalController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppBorderRadius.circularRadius4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: AppPaddings.allPadding16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  GlobalTexts.termsAndCondition,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                CustomCloseButton(onPressed: () => Get.back())
              ],
            ),
          ),
          8.kH,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 250,
              color: AppColors.background,
              padding: AppPaddings.allPadding12,
              child: SingleChildScrollView(
                child: Text(
                  HomeText.fullTermsAndConditions,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: AppColors.subtext,
                      ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Obx(
                () => IconButton(
                    onPressed: () => globalController
                        .termsAccepted(!globalController.termsAccepted.value),
                    icon: Icon(
                      globalController.termsAccepted.isTrue
                          ? PhosphorIcons.checkSquare(PhosphorIconsStyle.fill)
                          : PhosphorIcons.square(),
                      size: 16,
                      color: globalController.termsAccepted.isTrue
                          ? AppColors.primary
                          : AppColors.black,
                    )),
              ),
              Text(
                GlobalTexts.iAcceptTermsAndCondition,
                style: Theme.of(context).textTheme.displayMedium,
              )
            ],
          ),
          8.kH,
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomPrimaryButton(
                    color: AppColors.background,
                    borderColor: AppColors.border,
                    labelColor: AppColors.black,
                    label: GlobalTexts.cancel,
                    onClick: () {
                      Get.back();
                    },
                  ),
                ),
                16.kW,
                Expanded(
                  child: CustomPrimaryButton(
                    label: GlobalTexts.next,
                    onClick: () {
                      if (globalController.termsAccepted.isTrue) {
                        Get.offAndToNamed(Routes.agentShoppingOrderInfoScreen);
                        globalController.termsAccepted(false);
                      } else {
                        Utils.showErrorToast(
                            message: GlobalTexts.pleaseAcceptTermsAndCondition,
                            alignment: Alignment.topCenter);
                      }
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
