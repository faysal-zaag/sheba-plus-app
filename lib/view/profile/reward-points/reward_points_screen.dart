import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_images.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedBox_extension.dart';
import 'package:sheba_plus/view/components/paginated_listview.dart';
import 'package:sheba_plus/view/profile/controller/profile_controller.dart';
import 'package:sheba_plus/view/profile/order-history/widget/orders_loading.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';
import 'package:sheba_plus/view/profile/reward-points/widget/reward_points_card.dart';
import 'package:sheba_plus/view/styles.dart';

class RewardPointsScreen extends StatefulWidget {
  const RewardPointsScreen({super.key});

  @override
  State<RewardPointsScreen> createState() => _RewardPointsScreen();
}

class _RewardPointsScreen extends State<RewardPointsScreen> {
  final profileController = Get.find<ProfileController>();

  void _initCall() async {
    await profileController.getRedeemPointHistories();
  }

  @override
  void initState() {
    // TODO: implement initState
    _initCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: AppPaddings.screenPadding,
          decoration: Styles.roundedWhite.copyWith(color: AppColors.primary30, border: Border.all(color: AppColors.primary), boxShadow: [Styles.boxShadow]),
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    AppImages.giftBox,
                    height: 32,
                    width: 32,
                  ),
                  8.kH,
                  Text(
                    "${ProfileScreenTexts.yourTotalPoints}: ",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.subtext),
                  )
                ],
              ),
              16.kH,
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.0), border: Border.all(color: AppColors.border)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${ProfileScreenTexts.whichIsEquivalentTo} ",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                      style: Theme.of(context).textTheme.labelMedium,
                      "CAD ${profileController.user.value.account.point}",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        16.kH,
        Text(ProfileScreenTexts.pointHistory, style: Theme.of(context).textTheme.titleMedium,),
        16.kH,
        Expanded(
          child: Obx(
            () => profileController.getRedeemPointHistoriesLoading.isTrue
                ? const OrdersLoading()
                : PaginatedListview(
                    itemBuilder: (_, index) => RewardPointsCard(redeemPoint: profileController.redeemPointHistories[index],),
                    itemCount: profileController.redeemPointHistories.length,
                    onRefresh: onRefresh,
                    onFetchNextPage: onFetchNextPage,
                    fetchingMoreDataLoading: profileController.getMoreRedeemPointHistoriesLoading.value,
                    totalPages: profileController.totalPages.value,
                    noDataMessage: "No points found",
                    currentPage: profileController.currentPage.value,
                  ),
          ),
        ),
      ],
    );
  }

  Future<void> onRefresh() async {
    return await profileController.getRedeemPointHistories();
  }

  Future<void> onFetchNextPage() async {
    return await profileController.getRedeemPointHistories(page: profileController.currentPage.value + 1);
  }
}
