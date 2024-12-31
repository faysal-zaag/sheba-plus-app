import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/sizedBox_extension.dart';
import 'package:sheba_plus/view/profile/notification/widget/notification_shimmer_card.dart';
import 'package:sheba_plus/view/profile/order-history/widget/order_shimmer_card.dart';

class OrdersLoading extends StatelessWidget {
  const OrdersLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) => const OrderShimmerCard(),
      separatorBuilder: (_, index) => 12.kH,
      itemCount: 10,
    );
  }
}
