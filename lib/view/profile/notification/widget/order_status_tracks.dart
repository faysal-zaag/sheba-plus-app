import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/constant/app_paddings.dart';
import 'package:sheba_plus/utils/constant/sizedbox_extension.dart';
import 'package:sheba_plus/view/components/dashed_divider.dart';
import 'package:sheba_plus/view/components/message_container.dart';
import 'package:sheba_plus/view/profile/profile_screen_text.dart';

class OrderStatusTracks extends StatelessWidget {
  const OrderStatusTracks({super.key});

  @override
  Widget build(BuildContext context) {
    Widget divider = const Expanded(
        child: DashedDivider(
      marginBottom: 10,
      horizontalPadding: 4.0,
      color: AppColors.hintText,
      thickness: 2,
    ));
    Widget activeDivider = const Expanded(
        child: DashedDivider(
      marginBottom: 10,
      horizontalPadding: 4.0,
      color: AppColors.primary,
      thickness: 2,
    ));

    return Container(
      color: AppColors.white,
      padding: AppPaddings.allPadding16,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              OrderStatus(
                icon: PhosphorIcons.buildingApartment(),
                active: true,
              ),
              activeDivider,
              OrderStatus(
                icon: PhosphorIcons.airplaneTilt(),
                active: false,
              ),
              divider,
              OrderStatus(
                icon: PhosphorIcons.buildings(),
                active: false,
              ),
              divider,
              OrderStatus(
                icon: PhosphorIcons.truckTrailer(),
                active: false,
              ),
              divider,
              OrderStatus(
                icon: PhosphorIcons.package(),
                active: false,
              ),
            ],
          ),
          36.kH,
          MessageContainer(
            message: ProfileScreenTexts.inDhakaOffice,
            forOrderStatusMessage: true,
          ),
          MessageContainer(
            message: ProfileScreenTexts.onAir,
            forOrderStatusMessage: true,
          ),
          MessageContainer(
            message: ProfileScreenTexts.inOffice,
            forOrderStatusMessage: true,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          MessageContainer(
            message: ProfileScreenTexts.onTheWay,
            forOrderStatusMessage: true,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          MessageContainer(
            message: ProfileScreenTexts.delivered,
            orderDelivered: true,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
      ),
    );
  }
}

class OrderStatus extends StatelessWidget {
  final PhosphorIconData icon;
  final bool active;

  const OrderStatus({super.key, required this.icon, required this.active});

  @override
  Widget build(BuildContext context) {
    Color color = active ? AppColors.primary : AppColors.hintText;

    return Column(
      children: [
        Icon(
          icon,
          color: color,
        ),
        8.kH,
        Icon(
          PhosphorIcons.checkCircle(
              active ? PhosphorIconsStyle.fill : PhosphorIconsStyle.regular),
          color: color,
        ),
      ],
    );
  }
}
