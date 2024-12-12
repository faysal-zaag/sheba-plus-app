import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification_shimmer_card.dart';

class NotificationsLoading extends StatelessWidget {
  const NotificationsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => const NotificationCardShimmer(),
      separatorBuilder: (_, index) => 12.kH,
      itemCount: 10,
    );
  }
}
